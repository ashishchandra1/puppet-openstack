class openstack-neutron::params {
	
    $NEUTRON_DBPASS = '@dmin123'
    $CONTROLLER_HNAME = "controller"
    $ADMIN_PASSWORD = '@dmin123'
    $RABBIT_PASSWORD = '@dmin123' 

    $KEYSTONE_HOST = "controller"
    $KEYSTONE_ADMIN_PORT = '35357'
    $ADMIN_TOKEN = '@dmin123'
    $VERBOSE = "True"
    $RABBIT_HOSTS = "controller1:5672,controller2:5672,controller3:5672"
    $REGION = "regionOne"
     
    $admin_tenant = "admin"
    $admin_user =  "admin"
    $admin_user_pass = "@dmin123"
    $region = "regionOne"

    $METADATA_SECRET = '@dmin123' 

    $mysql_root_password = '@dmin123'
    $db_user = 'neutron'
    $db_name = 'neutron'
    $db_password = '@dmin123' 
    
    # OVS operations
    $DATA_BRIDGE = 'br-data'
    $EXT_BRIDGE  = 'br-ex'
    $COMPUTE_DATA_INTERFACE = 'enp10s0'  
    $NETWORK_DATA_INTERFACE = 'team1'
    $NETWORK_EXT_INTERFACE = 'team2'
    
    # ml2 config parameters 
    $DATA_VLAN_RANGES = "physnet1:500:699"
    $EXT_VLAN_RANGES = "physnet2"
    $TENANT_NETWORK_TYPES = 'vlan'
    $MECHANISM_DRIVERS = 'openvswitch,linuxbridge'
     
    $neutron_compute_packages = [
        "openstack-neutron",
        "openstack-neutron-ml2",
        "openstack-neutron-openvswitch"
    ]
    
    $neutron_network_packages = [
        "openstack-neutron",
        "openstack-neutron-ml2",
        "openstack-neutron-openvswitch"
    ]
     
    $neutron_controller_packages = [ 
        "openstack-neutron",
        "openstack-neutron-ml2",
        "python-neutronclient",
        "which"
    ]
}
