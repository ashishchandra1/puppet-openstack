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


# Creat the glance user.
keystone user-create --name=glance --pass="$admin_user_pass"


# Add the admin role to glance user
keystone  user-role-add --user glance --tenant service --role admin

# Create a glance service
keystone service-create --name glance --type image  --description "OpenStack Image Service"

# Create the Image Service API endpoints
keystone endpoint-create  --service-id $(keystone  service-list | awk '/ image / {print $2}') --publicurl http://"$keystone_host":9292 --internalurl http://"$keystone_host":9292 --adminurl http://"$keystone_host":9292 --region "$region"
