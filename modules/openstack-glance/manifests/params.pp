class openstack-glance::params {
    $GLANCE_USER_PASSWORD = '@dmin123'
    $CONTROLLER_HNAME = "controller" 
    $VERBOSE = 'True' 
    
    $MYSQL_ROOT_PASSWORD = '459nvDB91fWU'
    $GLANCE_DB_PASSWORD = 'sSQT9735FWFc'
    $MEMCACHED_SERVERS = "demo_controller1:11211, demo_controller2:11211, demo_controller3:11211"

    $KEYSTONE_HOST = "controller"
    $KEYSTONE_ADMIN_PORT = '35357'
    $ADMIN_TOKEN = '@dmin123'
     
    $admin_user_pass = "@dmin123"
    $region = "regionOne"

    $packages = [
        "openstack-glance"
    ]

    #### Ceph Configurations
    $STORES = 'rbd'
    $CEPH_CONF = '/etc/ceph/ceph.conf'
    $RBD_STORE_USER = 'glance'
    $RBD_STORE_POOL = 'images_1'
    $RBD_STORE_CHUNK_SIZE = '8'
}
