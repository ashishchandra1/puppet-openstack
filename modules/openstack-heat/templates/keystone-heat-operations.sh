#!/bin/sh
#
# Create Heat user and service.

keystone_host="<%=  @KEYSTONE_HOST %>"
admin_port="<%= @KEYSTONE_ADMIN_PORT %>"
admin_token="<%= @ADMIN_TOKEN %>"
region="<%= @region %>"

admin_tenant="<%=  @admin_tenant %>"
admin_user="<%= @admin_user %>"
admin_user_pass="<%= @admin_user_pass %>"
heat_user_pass="<%= @HEAT_USER_PASSWORD %>"

export OS_AUTH_URL=http://${keystone_host}:${admin_port}/v2.0
export OS_PROJECT_DOMAIN_ID=default
export OS_USER_DOMAIN_ID=default
export OS_PROJECT_NAME=admin
export OS_TENANT_NAME=${admin_tenant}
export OS_USERNAME=${admin_user}
export OS_PASSWORD=${admin_user_pass}
export OS_AUTH_URL=http://${keystone_host}:${admin_port}/v3

# Create the Heat user.
get_user_id () {
        openstack user list | awk -F'|' '{print $2,$3}' | awk -vuser_name="$1" ' $2 == user_name  {print $1} '
}

user_id=$(get_user_id heat)

if [ "$user_id" ]; then
        echo "Found existing user id: $user_id"
else
        # Create the user
        openstack user create heat --password="$heat_user_pass" --email="heat@example.com"

        # Add the admin role to heat user
        openstack role add --project service --user heat admin

        # Create the heat_stack_owner role
        openstack role create heat_stack_owner

        # Add the heat_stack_owner role to the demo tenant and user
        openstack role add --project demo --user demo heat_stack_owner
  
        # Create the heat_stack_user role
        openstack role create heat_stack_user

        user_id=$(get_user_id heat)

        if [ "$user_id" ]; then
                echo "Created new User: $user_id"
        else
                echo "ERROR: Failed to create User."
                exit 1
        fi
fi

#Create a Heat service
get_service_id () {
        openstack service list | awk -F'|' '{print $2,$3,$4}' | awk -vservice_name="$1" -vservice_type="$2" '
                 $2 == service_name && $3 == service_type {print $1} '
}

service_id=$(get_service_id heat orchestration )

if [ "$service_id" ]; then
        echo "Found existing service id: $service_id"
else
        # Create the service
        openstack service create --name heat  --description "OpenStack Orchestration service" orchestration

        service_id=$(get_service_id heat orchestration)

        if [ "$service_id" ]; then
                echo "Created new service id: $service_id"
        else
                echo "ERROR: Failed to create service."
                exit 1
        fi
fi

service_id=$(get_service_id heat-cfn cloudformation )

if [ "$service_id" ]; then
        echo "Found existing service id: $service_id"
else
        # Create the service
        openstack service create --name heat-cfn  --description "OpenStack Orchestration service" cloudformation

        service_id=$(get_service_id heat cloudformation)

        if [ "$service_id" ]; then
                echo "Created new service id: $service_id"
        else
                echo "ERROR: Failed to create service."
                exit 1
        fi
fi

# Create the Image Service API endpoints
get_keystone_endpoint () {
        openstack endpoint list |  awk -F'|' '{print $2,$3,$4,$5}' | awk -vservice_name="$1" -vservice_type="$2" '
               $3 == service_name && $4 == service_type {print $1} '
    }

endpoint_id=$(get_keystone_endpoint heat orchestration)

if [ "$endpoint_id" ]; then
        echo "Found existing endpoint: $endpoint_id"
else
   openstack endpoint create \
            --publicurl http://"$keystone_host":8004/v1/%\(tenant_id\)s \
            --internalurl http://"$keystone_host":8004/v1/%\(tenant_id\)s \
            --adminurl http://"$keystone_host":8004/v1/%\(tenant_id\)s \
            --region "$region" \
            orchestration
fi

endpoint_id=$(get_keystone_endpoint heat cloudformation )

if [ "$endpoint_id" ]; then
        echo "Found existing endpoint: $endpoint_id"
else
   openstack endpoint create \
            --publicurl http://"$keystone_host":8000/v1 \
            --internalurl http://"$keystone_host":8000/v1 \
            --adminurl http://"$keystone_host":8000/v1 \
            --region "$region" \
            cloudformation
fi

