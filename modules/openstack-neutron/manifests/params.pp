class openstack-neutron::params {
	
    $NEUTRON_USER_PASSWORD = '@dmin123'
    $CONTROLLER_HNAME = "openstack_controller"
    $ADMIN_PASSWORD = '@dmin123'
    $RABBIT_USER = 'openstack'
    $RABBIT_PASSWORD = '2v04VsaRkZfr'
    $KEYSTONE_ADMIN_PORT = '35357'
    $ADMIN_TOKEN = '@dmin123'
    $VERBOSE = "True"
    $RABBIT_HOSTS = "openstack_controller1:5672, openstack_controller2:5672, openstack_controller3:5672"
    $MEMCACHED_SERVERS = "openstack_controller1:11211, openstack_controller2:11211, openstack_controller3:11211"
     
    $admin_user_pass = "@dmin123"
    $region = "regionOne"

    $METADATA_SECRET = '@dmin123' 
    
    $MYSQL_ROOT_PASSWORD = '459nvDB91fWU'
    $NEUTRON_DB_PASSWORD = '3w550M3H32KO'

    # OVS operations
    $TUNNEL_INTERFACE_IP_ADDRESS = $ipaddress
    $DATA_BRIDGE = 'br-data'
    $EXT_BRIDGE  = 'br-ex'
    $COMPUTE_DATA_INTERFACE = 'bond0.212'  
    $NETWORK_DATA_INTERFACE = 'bond0.212'
    $NETWORK_EXT_INTERFACE = 'bond0.214'
    
    # ml2 config parameters 
    $DATA_VLAN_RANGES = 'physnet1:800:804'
    $EXT_VLAN_RANGES = 'physnet2'
    $TYPE_DRIVERS = 'local,flat,vlan,gre,vxlan'
    $TENANT_NETWORK_TYPES = 'vlan'
    $MECHANISM_DRIVERS = 'openvswitch,linuxbridge'
    $NETWORK_VLAN_RANGES = 'physnet1:800:804,physnet2'
     
    $neutron_compute_packages = [
        "openstack-neutron-openvswitch",
        "ebtables",
        "ipset"
    ]
    
    $neutron_controller_packages = [ 
        "openstack-neutron",
        "openstack-neutron-openvswitch",
        "openstack-neutron-ml2",
        "ebtables"
    ]
}
