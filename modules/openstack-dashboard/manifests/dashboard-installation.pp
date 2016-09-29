class openstack-dashboard::dashboard-installation {

     $CONTROLLER_HNAME = "controller"
     $ADMIN_TOKEN = '@dmin123'
     $packages = [
              "openstack-dashboard"
     ]
  
     notify {"Installing dashboard packages":} ->
     package {
              $packages:
              ensure =>installed,
      } ->
    
     notify {"Creating local_settings file":} ->
         file { "/etc/openstack-dashboard/local_settings":
              ensure  => file,
              owner  => root,
              group => apache,
              content => template('openstack-dashboard/local_settings.erb')
     }

}
