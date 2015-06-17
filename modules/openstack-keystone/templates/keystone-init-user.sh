#!/bin/sh
#
# Create administrative tenant and user.

keystone_host="<%=  @KEYSTONE_HOST %>"
public_port="<%= @KEYSTONE_PUBLIC_PORT  %>"
admin_port="<%= @KEYSTONE_ADMIN_PORT %>"
admin_token="<%= @ADMIN_TOKEN %>"
region="<%= @region %>"

admin_tenant="<%=  @admin_tenant %>"
admin_user="<%= @admin_user %>"
demo_user="<%= @demo_user %>"
demo_user_pass="<%= @demo_user_pass %>"
admin_user_pass="<%= @admin_user_pass %>"
demo_user_pass="<%= @demo_user_pass %>"


export OS_URL=http://${keystone_host}:${admin_port}/v2.0
export OS_TOKEN=${admin_token}

# Create admin project
openstack project create --description "Admin Project" admin > /dev/null

# Create the admin user.
openstack user create "$admin_user" --password "$admin_user_pass" --email="admin@example.com" >/dev/null

# Create the admin role
 openstack role create admin >/dev/null

# Add the admin user to the admin role
openstack role add --project admin --user admin admin > /dev/null

# Create service project
openstack project create --description "Service Project" service > /dev/null

# Create the demo project
openstack project create --description "Demo Project" demo

# Create the demo user
openstack user create "$demo_user" --password "$demo_user_pass" --email="demo@example.com" >/dev/null

# Create the demo role
 openstack role create demo >/dev/null

# Add the demo user to the demo role
 openstack role add --project demo --user demo user

