class openstack-heat::heat-installation inherits openstack-heat::params {

    notify {"Installing Openstack heat packages":} ->
    package {
          $packages:
          ensure =>installed,
    } ->

    file { "/etc/heat/heat.conf":
        ensure  => file,
        owner  => root,
        group  => heat,
        content => template('openstack-heat/heat.conf.erb'),
    }

}
