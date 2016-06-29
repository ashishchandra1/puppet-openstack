class openstack-neutron::params {
	
    $NEUTRON_USER_PASSWORD = '@dmin123'
    $CONTROLLER_HNAME = "controller"
    $ADMIN_PASSWORD = '@dmin123'
    $RABBIT_USER = 'openstack'
    $RABBIT_PASSWORD = '2v04VsaRkZfr'
    $KEYSTONE_HOST = "controller"
    $KEYSTONE_ADMIN_PORT = '35357'
    $ADMIN_TOKEN = '@dmin123'
    $VERBOSE = "True"
    $RABBIT_HOSTS = "controller1:5672,controller2:5672,controller3:5672"
    $MEMCACHED_SERVERS = "controller1:11211,controller2:11211,controller3:11211"
    $REGION = "regionOne"
     
    $admin_tenant = "admin"
    $admin_user =  "admin"
    $admin_user_pass = "@dmin123"
    $region = "regionOne"

    $METADATA_SECRET = '@dmin123' 
    
    $MYSQL_ROOT_PASSWORD = '459nvDB91fWU'
    $NEUTRON_DB_PASSWORD = '3w550M3H32KO'
    $NEUTRON_DB_USER = 'neutron'
    $NEUTRON_DB_NAME = 'neutron'

    # OVS operations
    $DATA_BRIDGE = 'br-data'
    $EXT_BRIDGE  = 'br-ex'
    $COMPUTE_DATA_INTERFACE = 'enp10s0'  
    $NETWORK_DATA_INTERFACE = 'enp9s0'
    $NETWORK_EXT_INTERFACE = 'enp7s0'
    
    # ml2 config parameters 
    $DATA_VLAN_RANGES = "physnet1:500:699"
    $EXT_VLAN_RANGES = "physnet2"
    $TENANT_NETWORK_TYPES = 'vlan'
    $MECHANISM_DRIVERS = 'openvswitch,linuxbridge'
     
    $neutron_compute_packages = [
        "openstack-neutron-linuxbridge",
        "etables",
        "ipset"
    ]
    
    $neutron_controller_packages = [ 
        "openstack-neutron",
        "openstack-neutron-ml2",
        " openstack-neutron-linuxbridge",
        "ebtables",
        "which"
    ]
}
