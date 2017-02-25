class openstack-nova::nova-compute::nova-compute-operations {

 notify {"Enabling Libvirt and Nova Compute Service":} ->
  exec {"Enable Libvirt and  Nova Compute Services":
    command => 'systemctl enable libvirtd.service openstack-nova-compute.service',
    user => 'root',
  } ->

  notify {"Restarting Libvirt and  Nova Compute Services":} ->
  exec {"Restart Libvirt and  Nova Compute Services":
    command => 'systemctl restart libvirtd.service openstack-nova-compute.service',
    user => 'root',
  }

}
