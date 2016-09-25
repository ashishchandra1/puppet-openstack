#!/bin/sh

tmpfile=$(mktemp keystoneXXXXXX)
trap "rm -f $tmpfile" 0

keystone_host="<%=  @KEYSTONE_HOST %>"
admin_port="<%= @KEYSTONE_ADMIN_PORT %>"
admin_token="<%= @ADMIN_TOKEN %>"
region="<%= @REGION %>"

export OS_URL=http://${keystone_host}:${admin_port}/v3
export OS_TOKEN=${admin_token}
export OS_IDENTITY_API_VERSION=3

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
        openstack endpoint create --region="$region" identity public http://controller:5000/v3
        openstack endpoint create --region="$region" identity internal http://controller:5000/v3
        openstack endpoint create --region="$region" identity admin http://controller:35357/v3
fi

