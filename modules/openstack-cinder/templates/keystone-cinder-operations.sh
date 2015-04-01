#!/bin/sh
#
# Create cinder user and service.

keystone_host="<%=  @KEYSTONE_HOST %>"
admin_port="<%= @KEYSTONE_ADMIN_PORT %>"
admin_token="<%= @ADMIN_TOKEN %>"
region="<%= @region %>"

admin_tenant="<%=  @admin_tenant %>"
admin_user="<%= @admin_user %>"
admin_user_pass="<%= @admin_user_pass %>"


export OS_TENANT_NAME=${admin_tenant}
export OS_USERNAME=${admin_user}
export OS_PASSWORD=${admin_user_pass}
export OS_AUTH_URL=http://${keystone_host}:${admin_port}/v2.0


# Creat the cinder user.


get_user_id () {
        keystone user-list |
                awk -F'|' '{print $2,$3,$4}' |
                awk -vuser_name="$1" '
                        $2 == user_name  {print $1}
                '
}

user_id=$(get_user_id cinder)

if [ "$user_id" ]; then
        echo "Found existing user id: $user_id"
else
        # Creat the user
        keystone user-create \
                --name=cinder \
                --pass="$admin_user_pass" > /dev/null
        # Add the admin role to glance user
        keystone  user-role-add --user cinder --tenant service --role admin
        user_id=$(get_user_id cinder)

        if [ "$user_id" ]; then
                echo "Created new User: $user_id"
        else
                echo "ERROR: Failed to create User."
                exit 1
        fi
fi

#Create a Cinder service
get_service_id () {
        keystone service-list |
                awk -F'|' '{print $2,$3,$4}' |
                awk -vservice_name="$1" -vservice_type="$2" '
                        $2 == service_name && $3 == service_type {print $1}
                '
}

service_id=$(get_service_id cinder volume)

if [ "$service_id" ]; then
        echo "Found existing service id: $service_id"
else
        # Creat the service and endpoint.
        keystone service-create \
                --name=cinder \
                --type=volume \
                --description="OpenStack Block Storage" > /dev/null

        service_id=$(get_service_id cinder volume)

        if [ "$service_id" ]; then
                echo "Created new service id: $service_id"
        else
                echo "ERROR: Failed to create service."
                exit 1
        fi
fi


#Create a cinderv2 service
service_id=$(get_service_id cinderv2 volumev2)

if [ "$service_id" ]; then
        echo "Found existing service id: $service_id"
else
        # Creat the service and endpoint.
        keystone service-create \
                --name=cinderv2 \
                --type=volumev2 \
                --description="OpenStack Block Storage" > /dev/null

        service_id=$(get_service_id cinderv2 volumev2)

        if [ "$service_id" ]; then
                echo "Created new service id: $service_id"
        else
                echo "ERROR: Failed to create service."
                exit 1
        fi
fi

# Create the Block Service API endpoints

keystone endpoint-create  --service-id $(keystone service-list | awk '/ volumev2 / {print $2}') --publicurl http://"$keystone_host":8776/v2/%\(tenant_id\)s --internalurl http://"$keystone_host":8776/v2/%\(tenant_id\)s --adminurl http://"$keystone_host":8776/v2/%\(tenant_id\)s --region "$region"

keystone endpoint-create --service-id $(keystone service-list | awk '/ volume / {print $2}') --publicurl http://"$keystone_host":8776/v1/%\(tenant_id\)s --internalurl http://"$keystone_host":8776/v1/%\(tenant_id\)s --adminurl http://"$keystone_host":8776/v1/%\(tenant_id\)s --region "$region"
