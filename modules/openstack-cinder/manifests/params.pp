class openstack-cinder::params {
    
    $CONTROLLER_HNAME = "controller"
    $RABBIT_HOSTS = "demo_controller1:5672, demo_controller2:5672, demo_controller3:5672"
    $MEMCACHED_SERVERS = "demo_controller1:11211, demo_controller2:11211, demo_controller3:11211"
    $RABBIT_USER = 'openstack'
    $RABBIT_PASSWORD = '2v04VsaRkZfr'
    $VERBOSE = 'True'
    $KEYSTONE_HOST = "controller"
    $KEYSTONE_ADMIN_PORT = '35357'
    $ADMIN_TOKEN = '@dmin123'
    $CINDER_USER_PASSWORD = '@dmin123'
    
    $MYSQL_ROOT_PASSWORD = '459nvDB91fWU'
    $CINDER_DB_PASSWORD = 'jvTjSYt3BOFF'
    
    $admin_user_pass = "@dmin123"
    $region = "regionOne"

    $MY_CONTROLLER_IP = "192.168.213.100"

    $cinder_packages = [
        "openstack-cinder",
        "targetcli",
        "python-keystone"
     ]

    ### CEPH_CONFIGURATIONS 
    $RBD_STORE_POOL = 'volumes_1'
    $RBD_STORE_USER = 'cinder'
    $CEPH_CONF = '/etc/ceph/ceph.conf'
    $RBD_SECRET_UUID = '457eb676-33da-42ec-9a8c-9293d545c337'
    $RBD_MAX_CLONE_DEPTH = '5'
    $RBD_STORE_CHUNK_SIZE = '4'
    $RADOS_CONNECT_TIMEOUT = '-1'
    $VOLUME_DRIVER = 'cinder.volume.drivers.rbd.RBDDriver'
}
