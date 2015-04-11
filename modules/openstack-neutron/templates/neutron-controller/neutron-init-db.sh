#!/bin/sh
# Register service and endpoints for neutron in keystone.
neutron_host="<%= @NEUTRON_HOST %>"
admin_port="<%= @NEUTRON_ADMIN_PORT %>"
admin_token="<%= @ADMIN_TOKEN %>"
export SERVICE_ENDPOINT="http://${neutron_host}:${admin_port}/v2.0/"
export SERVICE_TOKEN="${admin_token}"
# Create the database.
su -s /bin/sh -c "neutron-manage db_sync" neutron
