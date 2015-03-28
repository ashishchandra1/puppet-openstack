#!/bin/sh
# Register service and endpoints for keystone in keystone.
keystone_host="<%= @KEYSTONE_HOST %>"
admin_port="<%= @KEYSTONE_ADMIN_PORT %>"
admin_token="<%= @ADMIN_TOKEN %>"
export SERVICE_ENDPOINT="http://${keystone_host}:${admin_port}/v2.0/"
export SERVICE_TOKEN="${admin_token}"
# Create the database.
keystone-manage db_sync
