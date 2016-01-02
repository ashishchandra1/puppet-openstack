class openstack-glance::glance-operations {

 notify {"Enabled Openstack Glance Service":} ->
  exec {"Enabled Openstack Glance Services":
    command => 'systemctl enable openstack-glance-api.service openstack-glance-registry.service',
    user => 'root',
  } ->

  notify {"Restart Openstack Glance Services":} ->
  exec {"Restart Openstack Glance Services":
    command => 'systemctl restart openstack-glance-api.service openstack-glance-registry.service',
    user => 'root',
  }
}
