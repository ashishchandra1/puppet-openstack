class openstack-glance::glance-installation inherits openstack-glance::params {

    notify {"Installing Openstack glance packages":} ->
    package {
          $packages:
          ensure =>installed,
    } ->
   
    notify {"Creating glance-api.conf file":} ->   
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
    } ->
    
    notify {"Creating original glance-api.conf file":} ->
    file { "/etc/glance/glance-api.conf.orig":
        ensure  => file,
        owner  => root,
        group  => glance,
        content => template('openstack-glance/glance-api.conf.orig.erb'),
    } ->

    notify {"CREATING original glance-registry.conf FILE":} ->
    file { "/etc/glance/glance-registry.conf.orig":
        ensure  => file,
        owner  => root,
        group  => glance,
        content => template('openstack-glance/glance-registry.conf.orig.erb'),
    }
}
