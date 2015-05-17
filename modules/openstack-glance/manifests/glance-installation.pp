class openstack-glance::glance-installation {

     $GLANCE_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = "controller" 
     $VERBOSE = 'True' 
         
     $packages = [
              "openstack-glance",
              "python-glanceclient"
     ]

     notify {"Installing Openstack glance packages":} ->
     package {
          $packages:
          ensure =>installed,
    } ->
   
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
