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

export SERVICE_ENDPOINT=http://${keystone_host}:${admin_port}/v2.0/
export SERVICE_TOKEN=${admin_token}

tmpfile=$(mktemp keystoneXXXXXX)
trap "rm -f $tmpfile" 0

# Create the admin tenant
keystone tenant-create \
	--name="$admin_tenant" \
	--description 'Admin tenant' > $tmpfile
cat $tmpfile
tenant_id=$(echo $(awk -F'|' '$2 ~ "^ id " {print $3}' $tmpfile))

# Creat the admin user.
keystone user-create \
        --name="$admin_user" \
        --pass="$admin_user_pass" \
        --email="test@test.com"  > $tmpfile
cat $tmpfile
user_id=$(echo $(awk -F'|' '$2 ~ "^ id " {print $3}' $tmpfile))

# Create the admin role
keystone role-create \
  --name="admin" > $tmpfile
cat $tmpfile
role_id=$(echo $(awk -F'|' '$2 ~ "^ id " {print $3}' $tmpfile))

# Add the admin user to the admin role
keystone user-role-add \
  --user="admin" \
  --tenant="admin" \
  --role="admin" > $tmpfile
cat $tmpfile


tenant='service'
service_desc='Service Tenant'
# Create the service tenant
keystone tenant-create \
  --name="$tenant" \
  --description="$service_desc" > $tmpfile
cat $tmpfile
