class openstack-glance::glance-installation inherits openstack-glance::params {

    notify {"Installing Openstack glance packages":} ->
    package {
          $packages:
          ensure =>installed,
    } ->
   
    file { "/etc/glance/glance-api.conf":
        ensure  => file,
        owner  => root,
        group  => glance,
        content => template('openstack-glance/glance-api.conf.erb'),
    } ->

    notify {"CREATING glance-registry.conf FILE":} ->
    file { "/etc/glance/glance-registry.conf":
        ensure  => file,
        owner  => root,
        group  => glance,
        content => template('openstack-glance/glance-registry.conf.erb'),
    }
}
