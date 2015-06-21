class openstack-keystone::keystone-installation {

    $KEYSTONE_DBPASS = '@dmin123'
    $CONTROLLER_HNAME = 'controller' 
    $MEMCACHED_SERVERS = "controller1:11211,controller2:11211,controller3:11211"
    $VERBOSE = 'True' 
    $ADMIN_TOKEN = "@dmin123"        
    
    $packages = [
        "openstack-keystone",
        "python-openstackclient",
        "httpd",
        "mod_wsgi",
        "memcached",
        "python-memcached"
    ]

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
