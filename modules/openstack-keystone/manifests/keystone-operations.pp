class openstack-keystone::keystone-operations {

 notify {"Enabled Openstack Keystone Service":} ->
  exec {"Enabled Openstack Keystone Services":
    command => 'systemctl enable openstack-keystone.service',
    user => 'root',
  } ->

  notify {"Start Openstack Keystone Services":} ->
  exec {"Start Openstack Keystone Services":
    command => 'systemctl start openstack-keystone.service',
    user => 'root',
  }

}
