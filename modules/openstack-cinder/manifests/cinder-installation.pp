class openstack-cinder::cinder-installation {

     $CINDER_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = "controller"
     $RABBIT_HOSTS = "controller1:5672,controller2:5672,controller3:5672"
     $MEMCACHED_SERVERS = "controller1:11211,controller2:11211,controller3:11211"
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

