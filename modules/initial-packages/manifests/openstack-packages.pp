class initial-packages::openstack-packages {

    notify {"Installing Openstack Mitaka Packages":} ->
    package { 'centos-release-openstack-mitaka':
        ensure => installed,
    } ->

    notify {"Upgrading installed packages":} ->
    exec {'yum -y upgrade':} ->
 
    notify {"Install Python Openstack Client":} ->
    package { 'python-openstackclient':
        ensure => installed,
    } ->

    notify {"Install openstack SELinux package":} ->
    package { 'openstack-selinux':
        ensure => installed,
    }
}
