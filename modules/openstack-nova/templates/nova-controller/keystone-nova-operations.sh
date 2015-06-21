#!/bin/sh
#
# Create nova user and service.

keystone_host="<%=  @KEYSTONE_HOST %>"
admin_port="<%= @KEYSTONE_ADMIN_PORT %>"
admin_token="<%= @ADMIN_TOKEN %>"
region="<%= @region %>"

admin_tenant="<%=  @admin_tenant %>"
admin_user="<%= @admin_user %>"
admin_user_pass="<%= @admin_user_pass %>"


export OS_AUTH_URL=http://${keystone_host}:${admin_port}/v2.0
export OS_PROJECT_DOMAIN_ID=default
export OS_USER_DOMAIN_ID=default
export OS_PROJECT_NAME=admin
export OS_TENANT_NAME=${admin_tenant}
export OS_USERNAME=${admin_user}
export OS_PASSWORD=${admin_user_pass}
export OS_AUTH_URL=http://${keystone_host}:${admin_port}/v3


# Creat the nova user.
get_user_id () {
        openstack user list | awk -F'|' '{print $2,$3}' | awk -vuser_name="$1" ' $2 == user_name  {print $1}'
}

user_id=$(get_user_id nova)

if [ "$user_id" ]; then
        echo "Found existing user id: $user_id"
else
        # Create the user
        openstack user create nova --password="$admin_user_pass" --email="nova@example.com"
        
        # Add the admin role to nova user
        openstack role add --project service --user nova admin
        
        user_id=$(get_user_id nova)

        if [ "$user_id" ]; then
                echo "Created new User: $user_id"
        else
                echo "ERROR: Failed to create User."
                exit 1
        fi
fi

#Create a Nova service
get_service_id () {
    openstack service list | awk -F'|' '{print $2,$3,$4}' | awk -vservice_name="$1" -vservice_type="$2" '
                 $2 == service_name && $3 == service_type {print $1} '
}

service_id=$(get_service_id nova compute )

if [ "$service_id" ]; then
        echo "Found existing service id: $service_id"
else
        # Creat the service
        openstack service create --name nova  --description "OpenStack Compute" compute
    
        service_id=$(get_service_id nova compute)

        if [ "$service_id" ]; then
                echo "Created new service id: $service_id"
        else
                echo "ERROR: Failed to create service."
                exit 1
        fi
fi

# Create the Compute Service API endpoints
get_keystone_endpoint () {
        openstack endpoint list |  awk -F'|' '{print $2,$3,$4,$5}' | awk -vservice_name="$1" -vservice_type="$2" '
               $3 == service_name && $4 == service_type {print $1} '
           }

endpoint_id=$(get_keystone_endpoint nova compute )

if [ "$endpoint_id" ]; then
        echo "Found existing endpoint: $endpoint_id"
else
 
   openstack endpoint create \
            --publicurl http://"$keystone_host":8774/v2/%\(tenant_id\)s \
            --internalurl http://"$keystone_host":8774/v2/%\(tenant_id\)s \
            --adminurl http://"$keystone_host":8774/v2/%\(tenant_id\) \
            --region "$region" \
            compute
fi            
            

