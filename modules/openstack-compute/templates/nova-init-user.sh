#!/bin/sh
#
# Create nova user and administrator role.

keystone_host="<%=  @CONTROLLER_HNAME %>"
public_port="<%= @NOVA_PUBLIC_PORT  %>"
admin_user="<%= @NOVA_USER %>"
admin_user_pass="<%= @NOVA_USER_PASS %>"
service_type="<%= @SERVICE_TYPE %>"
service_name="<%= @SERVICE_NAME %>" 

admin_token="<%= @ADMIN_TOKEN %>"
admin_port="<%= @KEYSTONE_ADMIN_PORT %>"

export SERVICE_ENDPOINT=http://${keystone_host}:${admin_port}/v2.0/
export SERVICE_TOKEN=${admin_token}

tmpfile=$(mktemp keystoneXXXXXX)
trap "rm -f $tmpfile" 0


# Creat the admin user.
keystone user-create \
        --name="$admin_user" \
        --pass="$admin_user_pass" > $tmpfile
cat $tmpfile
user_id=$(echo $(awk -F'|' '$2 ~ "^ id " {print $3}' $tmpfile))


# Add the admin user to the admin role
keystone user-role-add \
  --user="nova" \
  --tenant="service" \
  --role="admin" > $tmpfile
cat $tmpfile


