class openstack-keystone::keystone-installation inherits openstack-keystone::params {    

    notify {"Installing Openstack Keystone and httpd packages":} ->
    package {
        $packages:
        ensure =>installed,
    } ->
   
    file { "/etc/keystone/keystone.conf":
       ensure  => file,
       owner  => root,
       group  => keystone,
       content => template('openstack-keystone/keystone.conf.erb'),
    }
}
