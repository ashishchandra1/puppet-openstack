class openstack-cinder::params {
    
    $CONTROLLER_HNAME = "controller"
    $RABBIT_HOSTS = "controller1:5672,controller2:5672,controller3:5672"
    $MEMCACHED_SERVERS = "controller1:11211,controller2:11211,controller3:11211"
    $RABBIT_PASSWORD = '@dmin123' 
    $VERBOSE = 'True'

    $KEYSTONE_HOST = "controller"
    $KEYSTONE_ADMIN_PORT = '35357'
    $ADMIN_TOKEN = '@dmin123'
    $CINDER_USER_PASSWORD = '@dmin123'
    
    $MYSQL_ROOT_PASSWORD = '459nvDB91fWU'
    $CINDER_DB_PASSWORD = 'jvTjSYt3BOFF'
    $CINDER_DB_NAME = 'cinder'
    $CINDER_DB_USER = 'cinder'
 
    $admin_tenant = "admin"
    $admin_user =  "admin"
    $admin_user_pass = "@dmin123"
    $region = "regionOne"

    $cinder_packages = [
        "openstack-cinder",
        "python-cinderclient",
        "python-oslo-db" 
     ]
}
