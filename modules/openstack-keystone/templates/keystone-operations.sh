#!/bin/sh
#
# Create Initial Keystone user, tenant  and service.

keystone_host="<%=  @KEYSTONE_HOST %>"
admin_token="<%= @ADMIN_TOKEN %>"
region="<%= @REGION %>"

admin_port="<%= @KEYSTONE_ADMIN_PORT %>"
admin_tenant="<%= @admin_tenant %>"
demo_tenant="<%= @demo_tenant %>"
service_tenant="<%= @service_tenant %>"
demo_user="<%= @demo_user %>"
demo_user_pass="<%= @demo_user_pass %>"
admin_user="<%= @admin_user %>"
admin_user_pass="<%= @admin_user_pass %>"

export OS_SERVICE_TOKEN=${admin_token}
export OS_SERVICE_ENDPOINT=http://${keystone_host}:${admin_port}/v2.0/

# Create the Admin tenant.
keystone tenant-create --name ${admin_tenant} --description "Admin Tenant"

# Create the admin user
keystone user-create  --name ${admin_user} --pass ${admin_user_pass} --email admin@example.com

#Create the admin role
keystone role-create --name admin

# Add the admin user to the admin role
keystone user-role-add --user ${admin_user} --tenant ${admin_tenant}  --role admin

# Create the demo tenant
keystone tenant-create --name ${demo_tenant} --description "Demo Tenant"

# Create demo user under demo tenant
keystone user-create --name ${demo_user} --tenant demo --pass ${demo_user_pass} --email demo@example.com

#Create service tenant
keystone tenant-create --name ${service_tenant} --description "Service Tenant"

#Create a Keystone service
get_service_id () {
        keystone service-list |  awk -F'|' '{print $2,$3,$4}' | awk -vservice_name="$1" -vservice_type="$2" '
                 $2 == service_name && $3 == service_type {print $1}'
}

service_id=$(get_service_id keystone identity)

if [ "$service_id" ]; then
        echo "Found existing service id: $service_id"
else
        # Creat the keystone service
        keystone service-create --name=keystone --type=identity --description="OpenStack Identity" > /dev/null

        service_id=$(get_service_id keystone identity)

        if [ "$service_id" ]; then
                echo "Created new service id: $service_id"
        else
                echo "ERROR: Failed to create service."
                exit 1
        fi
fi

# Create the Identity Service API endpoints
get_keystone_endpoint () {
        keystone endpoint-list | awk -F'|' '{print $7}' | awk -vservice_id="$1" '$1 == service_id  {print $1}'
}

endpoint_id=$(get_keystone_endpoint $service_id )

if [ "$endpoint_id" ]; then
        echo "Found existing endpoint: $endpoint_id"
else

   keystone endpoint-create  --service-id $(keystone service-list | awk '/ identity / {print $2}') \
            --publicurl http://"$keystone_host":5000 \
            --internalurl http://"$keystone_host":5000 \
            --adminurl http://"$keystone_host":35357 \
            --region "$region" > /dev/null
fi            
