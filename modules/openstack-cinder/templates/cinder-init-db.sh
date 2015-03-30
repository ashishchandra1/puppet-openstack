#!/bin/sh
# Register service and endpoints for cinder in keystone.
cinder_host="<%= @CINDER_HOST %>"
admin_port="<%= @CINDER_ADMIN_PORT %>"
admin_token="<%= @ADMIN_TOKEN %>"
export SERVICE_ENDPOINT="http://${cinder_host}:${admin_port}/v2.0/"
export SERVICE_TOKEN="${admin_token}"
# Create the database.
su -s /bin/sh -c "cinder-manage db_sync" cinder
