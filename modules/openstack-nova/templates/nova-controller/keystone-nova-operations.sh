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


export OS_TENANT_NAME=${admin_tenant}
export OS_USERNAME=${admin_user}
export OS_PASSWORD=${admin_user_pass}
export OS_AUTH_URL=http://${keystone_host}:${admin_port}/v2.0

# Creat the nova user.

get_user_id () {
        keystone user-list |
                awk -F'|' '{print $2,$3,$4}' |
                awk -vuser_name="$1" '
                        $2 == user_name  {print $1}
                '
}

user_id=$(get_user_id nova)

if [ "$user_id" ]; then
        echo "Found existing user id: $user_id"
else
        # Creat the user
        keystone user-create --name=nova --pass="$admin_user_pass" > /dev/null

        # Add the admin role to nova user
        keystone user-role-add --user nova --tenant service --role admin

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
        keystone service-list |
                awk -F'|' '{print $2,$3,$4}' |
                awk -vservice_name="$1" -vservice_type="$2" '
                        $2 == service_name && $3 == service_type {print $1}
                '
}
service_id=$(get_service_id nova compute )

if [ "$service_id" ]; then
        echo "Found existing service id: $service_id"
else
        # Creat the service and endpoint.
        keystone service-create \
                --name=nova \
                --type=compute \
                --description="OpenStack Compute" > /dev/null

        service_id=$(get_service_id nova compute)

        if [ "$service_id" ]; then
                echo "Created new service id: $service_id"
        else
                echo "ERROR: Failed to create service."
                exit 1
        fi
fi


# Create the Compute Service API endpoints

keystone endpoint-create  --service-id $(keystone service-list | awk '/ compute / {print $2}') --publicurl http://"$keystone_host":8774/v2/%\(tenant_id\)s --internalurl http://"$keystone_host":8774/v2/%\(tenant_id\)s --adminurl http://"$keystone_host":8774/v2/%\(tenant_id\)s --region "$region"

