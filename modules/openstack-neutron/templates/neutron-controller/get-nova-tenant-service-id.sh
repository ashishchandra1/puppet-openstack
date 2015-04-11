keystone_host="<%= @KEYSTONE_HOST %>"
admin_token="<%= @ADMIN_TOKEN %>"
admin_port="<%= @KEYSTONE_ADMIN_PORT %>"

export SERVICE_ENDPOINT=http://${keystone_host}:${admin_port}/v2.0/
export SERVICE_TOKEN=${admin_token}

service_id="$(keystone tenant-get service|awk -F'|' 'FNR ==6 {print $3}')" 

sed -i "s/nova_admin_tenant_id =/nova_admin_tenant_id = $service_id/g" /etc/neutron/neutron.conf
