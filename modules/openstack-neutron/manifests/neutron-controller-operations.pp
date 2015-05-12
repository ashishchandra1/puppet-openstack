class openstack-neutron::neutron-controller-operations {

    notify {"Restart compute services":}->
    exec {"Restarting compute services":
    command => 'systemctl restart openstack-nova-api.service openstack-nova-scheduler.service openstack-nova-conductor.service',
    user => 'root',
   } ->

 notify {"Enable Neutron Service":} ->
  exec {"Enabling Neutron Services":
    command => 'systemctl enable neutron-server.service',
    user => 'root',
  } ->

  notify {"Start Neutron Services":} ->
  exec {"Starting Neutron Services":
    command => 'systemctl start neutron-server.service',
    user => 'root',
  }

}
