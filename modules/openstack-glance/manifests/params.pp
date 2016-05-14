class openstack-glance::params {
    $GLANCE_USER_PASSWORD = '@dmin123'
    $CONTROLLER_HNAME = "controller" 
    $VERBOSE = 'True' 
    
    $MYSQL_ROOT_PASSWORD = '459nvDB91fWU'
    $GLANCE_DB_PASSWORD = 'sSQT9735FWFc'
    $GLANCE_DB_USER = 'glance'
    $GLANCE_DB_NAME = 'glance'

    $KEYSTONE_HOST = "controller"
    $KEYSTONE_ADMIN_PORT = '35357'
    $ADMIN_TOKEN = '@dmin123'
     
    $admin_tenant = "admin"
    $admin_user =  "admin"
    $admin_user_pass = "@dmin123"
    $region = "regionOne"

    $packages = [
        "openstack-glance",
        "python-glance",
        "python-glanceclient"
    ]

#### Ceph Configurations
    $STORES = 'rbd'
    $CEPH_CONF = '/etc/ceph/ceph.conf'
    $RBD_STORE_USER = 'glance'
    $RBD_STORE_POOL = 'openstack_images'
    $RBD_STORE_CHUNK_SIZE = '8'
    
}
