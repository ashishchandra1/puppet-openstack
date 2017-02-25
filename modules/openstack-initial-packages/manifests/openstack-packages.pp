class openstack-initial-packages::openstack-packages inherits openstack-initial-packages::params {

    notify {"Installing Openstack Newton Packages":} ->
    package { 'centos-release-openstack-newton':
        ensure => installed,
    } ->

    notify {"Upgrading installed packages":} ->
    exec {'yum -y upgrade':} ->

    notify {"Installing Openstack Initial Packages":} ->
    package {
        $packages:
        ensure =>installed,
    }
}
