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
admin_user_pass="<%= @admin_user_pass %>"
demo_user_pass="<%= @demo_user_pass %>"


export SERVICE_ENDPOINT=http://${keystone_host}:${admin_port}/v2.0/
export SERVICE_TOKEN=${admin_token}

# Create the admin tenant
keystone tenant-create 	--name="$admin_tenant" --description 'Admin tenant' > /dev/null

# Creat the admin user.
keystone user-create --name="$admin_user"  --pass="$admin_user_pass" --email="admin@example.com" >/dev/null

# Create the admin role
keystone role-create --name="admin" >/dev/null

# Add the admin user to the admin role
keystone user-role-add --user="admin" --tenant="admin" --role="admin" > /dev/null

# Create the demo tenant
keystone tenant-create --name=demo --description="Demo Tenant" > /dev/null

# Create the demo user under the demo tenant
keystone user-create --name=demo --tenant=demo --pass="$demo_user_pass" --email="demo@example.com" > /dev/null

# Create the service tenant
keystone tenant-create  --name=service --description="Service Tenant" > /dev/null
