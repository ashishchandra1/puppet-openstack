class openstack-nova::nova-compute-operations {

 notify {"Enable Nova Compute Service":} ->
  exec {"Enabled Nova Compute Services":
    command => 'systemctl enable libvirtd.service openstack-nova-compute.service',
    user => 'root',
  } ->

  notify {"Start Nova Compute Services":} ->
  exec {"start Nova Compute Services":
    command => 'systemctl start libvirtd.service openstack-nova-compute.service',
    user => 'root',
  }

}
