class openstack-cinder::cinder-installation {

     $CINDER_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = "controller"
     $RABBIT_PASS = '@dmin123' 
     $VERBOSE = 'True'

     $packages = [
              "openstack-cinder",
              "python-cinderclient",
              "python-oslo-db" 
     ]

     notify {"Installing Openstack cinder packages":} ->
     package {
          $packages:
          ensure =>installed,
    } ->

   notify {"CREATING cinder.conf FILE":} ->
   file { "/etc/cinder/cinder.conf":
       ensure  => file,
       owner  => root,
       group  => cinder,
       content => template('openstack-cinder/cinder.conf.erb'),
   }

}

