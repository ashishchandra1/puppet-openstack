class openstack-dashboard::dashboard-installation inherits openstack-dashboard::params {

     notify {"Installing Openstack dashboard packages":} ->
     package {
              $horizon_packages:
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
