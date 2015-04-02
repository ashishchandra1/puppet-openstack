class openstack-cinder::cinder-operations {

 notify {"Enable Cinder Service":} ->
  exec {"Enabled Cinder Services":
    command => 'systemctl enable openstack-cinder-api.service openstack-cinder-scheduler.service',
    user => 'root',
    require =>  Package["python-cinderclient"],
  } ->

  notify {"Restart Cinder Services":} ->
  exec {"Restart Cinder Services":
    command => 'systemctl restart openstack-cinder-api.service openstack-cinder-scheduler.service',
    user => 'root',
    require =>  Package["python-cinderclient"],
  }

}
