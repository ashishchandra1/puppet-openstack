class initial-packages::openstack-packages {
    notify {"Installing epel-release ":} ->
    package { "epel-release":
        ensure => installed,
        provider => rpm,
        source => "http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm",
        allow_virtual => false,
    } ->

    notify {"Installing RDO kilo release packages":} ->
    package {"rdo-release-kilo":
        ensure => installed,
        provider => rpm,
        source => "http://rdo.fedorapeople.org/openstack-kilo/rdo-release-kilo.rpm",
        allow_virtual => false,
    } -> 

    notify {"Upgrading installed packages":} ->
    exec {'yum -y upgrade':} ->
 
    notify {"Install openstack SELinux package":} ->
    package { 'openstack-selinux':
        ensure => installed,
    }
}
