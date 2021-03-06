class openstack-nova::nova-compute::nova-compute-installation inherits openstack-nova::params {
   
     notify {"Installing Openstack Nova on Compute Nodes":} ->
     package {
          $compute_packages: 
          ensure =>installed,
    } -> 

   notify {"CREATING nova.conf file for compute nodes":} ->
   file { "/etc/nova/nova.conf":
       ensure  => file,
       owner  => root,
       group  => nova,
       content => template('openstack-nova/nova-compute/nova.conf.erb'),
   } ->

   notify {"Editing libvirtd file for live migration":} ->
   file { "/etc/sysconfig/libvirtd":
       ensure  => file,
       owner  => root,
       group  => nova,
       content => template('openstack-nova/nova-compute/libvirtd.erb'),
   } ->

   notify {"Editing libvirtd.conf file for live migration":} ->
   file { "/etc/libvirt/libvirtd.conf":
       ensure  => file,
       owner  => root,
       group  => nova,
       content => template('openstack-nova/nova-compute/libvirtd.conf.erb'),
   } ->
   
   notify {"CREATING original nova.conf file for compute nodes":} ->
   file { "/etc/nova/nova.conf.orig":
       ensure  => file,
       owner  => root,
       group  => nova,
       content => template('openstack-nova/nova-compute/nova.conf.erb.orig'),
   }

}
