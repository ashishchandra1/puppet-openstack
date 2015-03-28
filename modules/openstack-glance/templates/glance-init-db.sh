#!/bin/sh
# Register service and endpoints for keystone in keystone.
glance_host="<%= @GLANCE_HOST %>"
admin_port="<%= @GLANCE_ADMIN_PORT %>"
admin_token="<%= @ADMIN_TOKEN %>"
export SERVICE_ENDPOINT="http://${glance_host}:${admin_port}/v2.0/"
export SERVICE_TOKEN="${admin_token}"
# Create the database.
su -s /bin/sh -c "glance-manage db_sync" glance
