class openstack-initial-packages::params {
    
    $packages = [
        "ntp",
        "python-openstackclient",
        "openstack-selinux",
        "memcached",
        "python-memcached"
    ]
}
