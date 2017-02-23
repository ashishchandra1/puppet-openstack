#!/bin/sh
#
# Create administrative tenant and user.

CONTROLLER_HNAME="<%=  @CONTROLLER_HNAME %>"
ADMIN_PORT="<%= @KEYSTONE_ADMIN_PORT %>"
ADMIN_TOKEN="<%= @ADMIN_TOKEN %>"

DEMO_USER_PASS="<%= @DEMO_USER_PASS %>"

export OS_USERNAME=admin
export OS_PASSWORD=${ADMIN_TOKEN}
export OS_PROJECT_NAME=admin
export OS_USER_DOMAIN_NAME=Default
export OS_PROJECT_DOMAIN_NAME=Default
export OS_AUTH_URL=http://${CONTROLLER_HNAME}:${ADMIN_PORT}/v3
export OS_IDENTITY_API_VERSION=3

# Create service project
sleep 5
openstack project create --domain Default --description "Service Project" service

# Create the demo project
openstack project create --domain Default --description "Demo Project" demo

# Create the demo user
openstack user create --domain Default --password "$DEMO_USER_PASS" demo

# Create the user role
openstack role create user

# Add the demo user to the demo role
openstack role add --project demo --user demo user
