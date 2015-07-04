class openstack-nova::nova-compute::nova-compute-installation inherits openstack-nova::params {
   
     notify {"Installing Openstack Nova on Compute Nodes":} ->
     package {
          $compute_packages: 
          ensure =>installed,
    } -> 

   notify {"CREATING nova.conf FILE":} ->
   file { "/etc/nova/nova.conf":
       ensure  => file,
       owner  => root,
       group  => nova,
       content => template('openstack-nova/nova-compute/nova.conf.erb'),
   }

}
