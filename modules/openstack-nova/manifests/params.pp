class openstack-nova::params {
    $NOVA_USER_PASSWORD = '@dmin123'
    $NEUTRON_USER_PASSWORD = '@dmin123'
    $KEYSTONE_ADMIN_PORT = '35357'
    $ADMIN_TOKEN = '@dmin123'
    $CONTROLLER_HNAME = "openstack_controller"
    $VERBOSE = "True"
    $MEMCACHED_SERVERS = "openstack_controller1:11211,openstack_controller2:11211,openstack_controller3:11211"

    $TRANSPORT_URL = "rabbit://openstack:2v04VsaRkZfr@openstack_controller1,openstack:2v04VsaRkZfr@openstack_controller2,openstack:2v04VsaRkZfr@openstack_controller3"
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

    ##### CEPH CONFIGURATIONS

    $IMAGES_TYPE = 'rbd'
    $IMAGES_RBD_POOL = 'os_vms'
    $CEPH_CONF = '/etc/ceph/ceph.conf'
    $RBD_STORE_USER = 'cinder'
    $RBD_SECRET_UUID = '457eb676-33da-42ec-9a8c-9293d545c337'
    
}
