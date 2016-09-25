#!/bin/sh
#
# Create administrative tenant and user.

keystone_host="<%=  @KEYSTONE_HOST %>"
admin_port="<%= @KEYSTONE_ADMIN_PORT %>"
admin_token="<%= @ADMIN_TOKEN %>"

demo_user_pass="<%= @demo_user_pass %>"
admin_user_pass="<%= @admin_user_pass %>"

export OS_URL=http://${keystone_host}:${admin_port}/v3
export OS_TOKEN=${admin_token}
export OS_IDENTITY_API_VERSION=3

# Create default domian
openstack domain create --description "Default Domain" default

# Create admin project
openstack project create --domain default --description "Admin Project" admin

# Create the admin user.
openstack user create --domain default --password "$admin_user_pass" admin

# Create the admin role
openstack role create admin

# Add the admin user to the admin role
openstack role add --project admin --user admin admin

# Create service project
openstack project create --domain default --description "Service Project" service

# Create the demo project
openstack project create --domain default --description "Demo Project" demo

# Create the demo user
openstack user create --domain default --password "$demo_user_pass" demo

# Create the user role
openstack role create user

# Add the demo user to the demo role
openstack role add --project demo --user demo user
