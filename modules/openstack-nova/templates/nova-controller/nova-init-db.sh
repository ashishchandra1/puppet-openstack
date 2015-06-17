#!/bin/sh
# Register service and endpoints for nova in keystone.
nova_host="<%= @NOVA_HOST %>"
admin_port="<%= @NOVA_ADMIN_PORT %>"
admin_token="<%= @ADMIN_TOKEN %>"
export SERVICE_ENDPOINT="http://${nova_host}:${admin_port}/v2.0/"
export SERVICE_TOKEN="${admin_token}"
# Create the database.
su -s /bin/sh -c "nova-manage db sync" nova
