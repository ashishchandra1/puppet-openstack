class nova-controller::nova-operations {

 notify {"Enable Nova Service":} ->
  exec {"Enabled Nova Services":
    command => 'systemctl enable openstack-nova-api.service openstack-nova-cert.service  openstack-nova-consoleauth.service openstack-nova-scheduler.service  openstack-nova-conductor.service openstack-nova-novncproxy.service',
    user => 'root',
    require =>  Package["python-novaclient"],
  } ->

  notify {"Start Nova Services":} ->
  exec {"start Nova Services":
    command => 'systemctl start openstack-nova-api.service openstack-nova-cert.service openstack-nova-consoleauth.service openstack-nova-scheduler.service  openstack-nova-conductor.service openstack-nova-novncproxy.service',
    user => 'root',
    require =>  Package["python-cinderclient"],
  }

}
