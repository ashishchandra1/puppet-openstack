#!/bin/sh
#
# Create glance user and service.

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

# Create the Glance User
get_user_id () {
        keystone user-list | awk -F'|' '{print $2,$3,$4}' | awk -vuser_name="$1" ' $2 == user_name  {print $1} '
}

user_id=$(get_user_id glance)

if [ "$user_id" ]; then
        echo "Found existing user id: $user_id"
else
        # Create the user
        keystone user-create --name=glance --pass="$admin_user_pass" > /dev/null
        # Add the admin role to glance user
        keystone  user-role-add --user glance --tenant service --role admin
        user_id=$(get_user_id $user_name)

        if [ "$user_id" ]; then
                echo "Created new User: $user_id"
        else
                echo "ERROR: Failed to create User."
                exit 1
        fi
fi


#Create a Glance service
get_service_id () {
        keystone service-list | awk -F'|' '{print $2,$3,$4}' | awk -vservice_name="$1" -vservice_type="$2" ' $2 == service_name && $3 == service_type {print $1} '
}

service_id=$(get_service_id glance image)

if [ "$service_id" ]; then
        echo "Found existing service id: $service_id"
else
        # Creat the service 
        keystone service-create --name=glance --type=image --description="Openstack Image Service" > /dev/null

        service_id=$(get_service_id $service_name $service_type)

        if [ "$service_id" ]; then
                echo "Created new service id: $service_id"
        else
                echo "ERROR: Failed to create service."
                exit 1
        fi
fi

# Create the Image Service API endpoints
get_keystone_endpoint () {
        keystone endpoint-list | awk -F'|' '{print $7}' | awk -vservice_id="$1" '$1 == service_id  {print $1}'
}

endpoint_id=$(get_keystone_endpoint $service_id )

if [ "$endpoint_id" ]; then
        echo "Found existing endpoint: $endpoint_id"
else
    keystone endpoint-create  --service-id $(keystone  service-list | awk '/ image / {print $2}') \
             --publicurl http://"$keystone_host":9292 \
             --internalurl http://"$keystone_host":9292 \ 
             --adminurl http://"$keystone_host":9292 \
             --region "$region" > /dev/null
fi             
