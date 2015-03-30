#!/bin/sh

# Register service and endpoints for keystone in keystone.
keystone_host="<%= @CONTROLLER_HNAME %>"
admin_port="<%= @KEYSTONE_ADMIN_PORT %>"
admin_token="<%= @ADMIN_TOKEN %>"
export SERVICE_ENDPOINT="http://${keystone_host}:${admin_port}/v2.0/"
export SERVICE_TOKEN="${admin_token}"


# Initialize the database.
nova-manage db sync

