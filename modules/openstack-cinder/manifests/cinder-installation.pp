class openstack-cinder::cinder-installation inherits openstack-cinder::params {

     notify {"Installing Openstack cinder packages":} ->
     package {
          $cinder_packages:
          ensure =>installed,
    } ->

   notify {"CREATING cinder.conf FILE":} ->
   file { "/etc/cinder/cinder.conf":
       ensure  => file,
       owner  => cinder,
       group  => cinder,
       content => template('openstack-cinder/cinder.conf.erb'),
   } ->

   notify {"CREATING original cinder.conf FILE":} ->
   file { "/etc/cinder/cinder.conf.orig":
       ensure  => file,
       owner  => cinder,
       group  => cinder,
       content => template('openstack-cinder/cinder.conf.erb.orig'),
   }

}

