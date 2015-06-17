#!/bin/sh

tmpfile=$(mktemp keystoneXXXXXX)
trap "rm -f $tmpfile" 0

keystone_host="<%=  @KEYSTONE_HOST %>"
public_port="<%= @KEYSTONE_PUBLIC_PORT  %>"
admin_port="<%= @KEYSTONE_ADMIN_PORT %>"
admin_token="<%= @ADMIN_TOKEN %>"
region="<%= @REGION %>"

export OS_URL=http://${keystone_host}:${admin_port}/v2.0
export OS_TOKEN=${admin_token}

get_service_id () {
	openstack service list |
		awk -F'|' '{print $2,$3,$4}' | awk -vservice_name="$1" -vservice_type="$2" '
			$2 == service_name && $3 == service_type {print $1} '
}

service_id=$(get_service_id keystone identity)

if [ "$service_id" ]; then
	echo "Found existing service id: $service_id"
else
	# Create the service and endpoint.
	openstack service create --name keystone --description "OpenStack Identity" identity

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
	    openstack endpoint list | 
	        awk -F'|' '{print $2,$3,$4,$5}' | awk -vservice_name="$1" -vservice_type="$2" '
	           $3 == service_name && $4 == service_type {print $1} '
}

endpoint_id=$(get_keystone_endpoint keystone identity )

if [ "$endpoint_id" ]; then
        echo "Found existing endpoint: $endpoint_id"
else
        openstack endpoint create --region="$region" \
	    --publicurl=http://controller:5000/v2.0 \
	    --internalurl=http://controller:5000/v2.0 \
	    --adminurl=http://controller:35357/v2.0 \
	    identity
fi

