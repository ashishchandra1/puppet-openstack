#!/bin/sh

tmpfile=$(mktemp keystoneXXXXXX)
trap "rm -f $tmpfile" 0

region="<%= region %>"
service_name="<%= service_name %>"
service_type="<%= service_type %>"
service_desc="<%= service_description %>"
service_public_url="<%= service_public_url %>"
service_internal_url="<%= service_internal_url %>"
service_admin_url="<%= service_admin_url %>"

keystone_host="<%=  @KEYSTONE_HOST %>"
public_port="<%= @KEYSTONE_PUBLIC_PORT  %>"
admin_port="<%= @KEYSTONE_ADMIN_PORT %>"
admin_token="<%= @ADMIN_TOKEN %>"
region="<%= @region %>"



export SERVICE_ENDPOINT=http://${keystone_host}:${admin_port}/v2.0/
export SERVICE_TOKEN=${admin_token}


# Check if service exists
# get_service_id <name> <type>
get_service_id () {
	keystone service-list |
		awk -F'|' '{print $2,$3,$4}' |
		awk -vservice_name="$1" -vservice_type="$2" '
			$2 == service_name && $3 == service_type {print $1}
		'
}

######################################################################

service_id=$(get_service_id $service_name $service_type)

if [ "$service_id" ]; then
	echo "Found existing service id: $service_id"
else
	# Creat the service and endpoint.
	keystone service-create \
		--name="$service_name" \
		--type="$service_type" \
		--description="$service_desc" > /dev/null

	service_id=$(get_service_id $service_name $service_type)

	if [ "$service_id" ]; then
		echo "Created new service id: $service_id"
	else
		echo "ERROR: Failed to create service."
		exit 1
	fi
fi


keystone endpoint-create \
	--region="$region" \
	--service_id="$service_id" \
	--publicurl="$service_public_url" \
	--internalurl="$service_internal_url" \
	--adminurl="$service_admin_url"

