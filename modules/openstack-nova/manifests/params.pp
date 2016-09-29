class openstack-nova::params {
    $NOVA_USER_PASSWORD = '@dmin123'
    $KEYSTONE_HOST = "controller"
    $KEYSTONE_ADMIN_PORT = '35357'
    $ADMIN_TOKEN = '@dmin123'
    $CONTROLLER_HNAME = "controller"
    $ADMIN_USER = 'nova'
    $ADMIN_PASSWORD = '@dmin123'
    $RABBIT_USER = 'openstack' 
    $RABBIT_PASSWORD = '2v04VsaRkZfr' 
    $VERBOSE = "True"
    $RABBIT_HOSTS = "demo_controller1:5672, demo_controller2:5672, demo_controller3:5672"
    $MEMCACHED_SERVERS = "demo_controller1:11211, demo_controller2:11211, demo_controller3:11211"
 
    $METADATA_SECRET = "@dmin123"
    
    $MYSQL_ROOT_PASSWORD = '459nvDB91fWU'
    $NOVA_DB_PASSWORD = '5M37vBRU55hO'

    $admin_user_pass = "@dmin123"
    $region = "regionOne"

    $MY_CONTROLLER_IP = "192.168.213.100"
    $MY_COMPUTE_IP = $ipaddress

    $controller_packages = [ 
        "openstack-nova-api",
        "openstack-nova-conductor",
        "openstack-nova-console",
        "openstack-nova-novncproxy",
        "openstack-nova-scheduler"
    ]

    $compute_packages = [
        "openstack-nova-compute"
    ]
}
