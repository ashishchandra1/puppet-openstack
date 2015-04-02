class openstack-cinder::cinder-installation {

     $CINDER_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = $hostname 
     $CINDER_HOST = $ipaddress
     $CINDER_ADMIN_PORT = '8776'
     $ADMIN_TOKEN = '@dmin123'
     $RABBIT_PASS = '@dmin123' 
     notify {"Installing Openstack cinder":} ->
     package {'openstack-cinder':
          ensure =>installed,
    } ->

    notify {"Installing Cinder client":} ->
    package { 'python-cinderclient':
          ensure => installed,
   } ->


    notify {"Installing Python oslo db":} ->
    package { 'python-oslo-db':
          ensure => installed,
   } ->

   notify {"CREATING cinder.conf FILE":} ->
   file { "/etc/cinder/cinder.conf":
       ensure  => file,
       owner  => root,
       group  => cinder,
       content => template('openstack-cinder/cinder.conf.erb'),
   }

}

