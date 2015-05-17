#!/bin/sh

tmpfile=$(mktemp keystoneXXXXXX)
trap "rm -f $tmpfile" 0

keystone_host="<%=  @KEYSTONE_HOST %>"
public_port="<%= @KEYSTONE_PUBLIC_PORT  %>"
admin_port="<%= @KEYSTONE_ADMIN_PORT %>"
admin_token="<%= @ADMIN_TOKEN %>"
region="<%= @REGION %>"

export SERVICE_ENDPOINT=http://${keystone_host}:${admin_port}/v2.0/
export SERVICE_TOKEN=${admin_token}

get_service_id () {
	keystone service-list |
		awk -F'|' '{print $2,$3,$4}' | awk -vservice_name="$1" -vservice_type="$2" '
			$2 == service_name && $3 == service_type {print $1} '
}

service_id=$(get_service_id keystone identity)

if [ "$service_id" ]; then
	echo "Found existing service id: $service_id"
else
	# Creat the service and endpoint.
	keystone service-create --name=keystone --type=identity --description="OpenStack Identity" > /dev/null

	service_id=$(get_service_id keystone identity)

	if [ "$service_id" ]; then
		echo "Created new service id: $service_id"
	else
		echo "ERROR: Failed to create service."
		exit 1
	fi
fi

# Create the Identity Service API endpoints
get_keystone_endpoint () {
        keystone endpoint-list | awk -F'|' '{print $7}' | awk -vservice_id="$1" '$1 == service_id  {print $1}'
}

endpoint_id=$(get_keystone_endpoint $service_id )

if [ "$endpoint_id" ]; then
        echo "Found existing endpoint: $endpoint_id"
else
        keystone endpoint-create --region="$region" --service_id="$service_id" \
	    --publicurl=http://controller:5000/v2.0 \
	    --internalurl=http://controller:5000/v2.0 \
	    --adminurl=http://controller:35357/v2.0

fi

