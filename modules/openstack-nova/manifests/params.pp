class openstack-nova::params {
    $KEYSTONE_HOST = "controller"
    $KEYSTONE_ADMIN_PORT = '35357'
    $ADMIN_TOKEN = '@dmin123'
    $NOVA_DBPASS = '@dmin123'
    $CONTROLLER_HNAME = "controller"
    $ADMIN_USER = 'nova'
    $ADMIN_PASSWORD = '@dmin123'
    $RABBIT_PASSWORD = '@dmin123' 
    $VERBOSE = "True"
    $RABBIT_HOSTS = "controller1:5672,controller2:5672,controller3:5672"
    $MEMCACHED_SERVERS = "controller1:11211,controller2:11211,controller3:11211"
    $MY_IP = "10.0.129.20"
    $METADATA_SECRET = "@dmin123"
    $admin_tenant = "admin"
    $admin_user =  "admin"
    $admin_user_pass = "@dmin123"
    $region = "regionOne"

    $controller_packages = [ 
        "openstack-nova-api",
        "openstack-nova-cert",
        "openstack-nova-conductor",
        "openstack-nova-console",
        "openstack-nova-novncproxy",
        "openstack-nova-scheduler",
        "python-novaclient"
    ]

    $compute_packages = [
        "openstack-nova-compute",
        "sysfsutils"
    ]
}