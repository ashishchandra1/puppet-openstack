class openstack-glance::params {
    $GLANCE_USER_PASSWORD = '@dmin123'
    $CONTROLLER_HNAME = "controller" 
    $VERBOSE = 'True' 
    
    $MYSQL_ROOT_PASSWORD = '459nvDB91fWU'
    $GLANCE_DB_PASSWORD = 'sSQT9735FWFc'
    $MEMCACHED_SERVERS = "controller1:11211,controller2:11211,controller3:11211"

    $KEYSTONE_HOST = "controller"
    $KEYSTONE_ADMIN_PORT = '35357'
    $ADMIN_TOKEN = '@dmin123'
     
    $admin_user_pass = "@dmin123"
    $region = "regionOne"

    $packages = [
        "openstack-glance"
    ]
}
