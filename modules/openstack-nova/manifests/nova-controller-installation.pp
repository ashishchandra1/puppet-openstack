class openstack-nova::nova-controller-installation inherits openstack-nova::params {
    
    notify {"Installing Openstack Nova on Controller Nodes":} ->
     package {
          $controller_packages: 
          ensure =>installed,
    } -> 

   notify {"CREATING nova.conf FILE":} ->
   file { "/etc/nova/nova.conf":
       ensure  => file,
       owner  => root,
       group  => nova,
       content => template('openstack-nova/nova-controller/nova.conf.erb'),
   } ->

  notify {"CREATING original nova.conf FILE":} ->
   file { "/etc/nova/nova.conf.orig":
       ensure  => file,
       owner  => root,
       group  => nova,
       content => template('openstack-nova/nova-controller/nova.conf.erb.orig'),
   }
}
