class openstack-cinder::params {
    
    $CINDER_DB_PASSWORD = '@dmin123'
    $CONTROLLER_HNAME = "controller"
    $RABBIT_HOSTS = "controller1:5672,controller2:5672,controller3:5672"
    $MEMCACHED_SERVERS = "controller1:11211,controller2:11211,controller3:11211"
    $RABBIT_PASSWORD = '@dmin123' 
    $VERBOSE = 'True'

    $KEYSTONE_HOST = "controller"
    $KEYSTONE_ADMIN_PORT = '35357'
    $ADMIN_TOKEN = '@dmin123'
     
    $admin_tenant = "admin"
    $admin_user =  "admin"
    $admin_user_pass = "@dmin123"
    $region = "regionOne"

    $mysql_password = '@dmin123'
    $db_user = 'cinder'
    $db_name = 'cinder'
    $db_password = '@dmin123'

    $cinder_packages = [
        "openstack-cinder",
        "python-cinderclient",
        "python-oslo-db" 
     ]
}