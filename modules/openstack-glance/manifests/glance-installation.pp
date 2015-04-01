class openstack-glance::glance-installation {

     $GLANCE_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = $hostname 
     $GLANCE_HOST = $ipaddress
     $GLANCE_ADMIN_PORT = '9292'
     $ADMIN_TOKEN = '@dmin123'
     
     notify {"Installing Openstack glance":} ->
     package {'openstack-glance':
          ensure =>installed,
    } ->

    notify {"Installing Glance client":} ->
    package { 'python-glanceclient':
          ensure => installed,
   } ->

   notify {"CREATING glance-api.conf FILE":} ->
   file { "/etc/glance/glance-api.conf":
       ensure  => file,
       owner  => root,
       group  => glance,
       content => template('openstack-glance/glance-api.erb'),
   } ->

   notify {"CREATING glance-registry.conf FILE":} ->
   file { "/etc/glance/glance-registry.conf":
       ensure  => file,
       owner  => root,
       group  => glance,
       content => template('openstack-glance/glance-registry.erb'),
   }

}
