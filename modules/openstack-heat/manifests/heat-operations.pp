class openstack-heat::heat-operations {

 notify {"Enabled Openstack Heat Service":} ->
  exec {"Enabled Openstack Heat Services":
    command => 'systemctl enable openstack-heat-api.service openstack-heat-api-cfn.service openstack-heat-engine.service',
    user => 'root',
  } ->

  notify {"Restart Openstack Heat Services":} ->
  exec {"Restart Openstack Heat Services":
    command => 'systemctl restart openstack-heat-api.service openstack-heat-api-cfn.service openstack-heat-engine.service',
    user => 'root',
  }

}
