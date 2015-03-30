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
keystone user-create --name=cinder --pass="$admin_user_pass"


# Add the admin role to cinder user
keystone  user-role-add --user cinder --tenant service --role admin

# Create a cinder service
keystone service-create --name cinder --type volume  --description "OpenStack Block Storage"

#Create a cinderv2 service
keystone service-create --name cinderv2 --type volumev2 --description "OpenStack Block Storage"

# Create the Block Service API endpoints

keystone endpoint-create  --service-id $(keystone service-list | awk '/ volumev2 / {print $2}') --publicurl http://"$keystone_host":8776/v2/%\(tenant_id\)s --internalurl http://"$keystone_host":8776/v2/%\(tenant_id\)s --adminurl http://"$keystone_host":8776/v2/%\(tenant_id\)s --region "$region"

keystone endpoint-create --service-id $(keystone service-list | awk '/ volume / {print $2}') --publicurl http://"$keystone_host":8776/v1/%\(tenant_id\)s --internalurl http://"$keystone_host":8776/v1/%\(tenant_id\)s --adminurl http://"$keystone_host":8776/v1/%\(tenant_id\)s --region "$region"
