class openstack-neutron::params {
	
    $NEUTRON_USER_PASSWORD = '@dmin123'
    $NOVA_USER_PASSWORD = '@dmin123'
    $CONTROLLER_HNAME = "openstack_controller"
    $ADMIN_PASSWORD = '@dmin123'
    $KEYSTONE_ADMIN_PORT = '35357'
    $ADMIN_TOKEN = '@dmin123'
    $VERBOSE = "True"
    $MEMCACHED_SERVERS = "openstack_controller1:11211,openstack_controller2:11211,openstack_controller3:11211"
    
    $TRANSPORT_URL = "rabbit://openstack:2v04VsaRkZfr@openstack_controller1,openstack:2v04VsaRkZfr@openstack_controller2,openstack:2v04VsaRkZfr@openstack_controller3"
 
    $admin_user_pass = "@dmin123"
    $region = "regionOne"

    $METADATA_SECRET = '@dmin123' 
    
    $MYSQL_ROOT_PASSWORD = '459nvDB91fWU'
    $NEUTRON_DB_PASSWORD = '3w550M3H32KO'


    $FIREWALL_DRIVER = 'neutron.agent.linux.iptables_firewall.OVSHybridIptablesFirewallDriver'
    $INTERFACE_DRIVER= 'neutron.agent.linux.interface.OVSInterfaceDriver'

    # OVS operations
    $LOCAL_IP_ADDRESS = $ipaddress
    $EXTERNAL_BRIDGE  = 'br-ex'
    $INTEGRATION_BRIDGE  = 'br-int'
    $TUNNEL_BRIDGE  = 'br-tun'
    $EXTERNAL_BRIDGE_INTERFACE = 'bond0.214'

    # DHCP and L3 Agent HA
    $DHCP_AGENTS_PER_NETWORK = 1
    $MAX_L3_AGENTS_PER_NETWORK = 1
    $MIN_L3_AGENTS_PER_NETWORK = 1
    
    # ml2 config parameters 
    $DATA_VLAN_RANGES = 'physnet1:800:804'
    $EXT_VLAN_RANGES = 'physnet2'
    $TYPE_DRIVERS = 'local,flat,vlan,gre,vxlan'
    $TENANT_NETWORK_TYPES = 'vxlan'
    $MECHANISM_DRIVERS = 'openvswitch,linuxbridge'
    $VNI_RANGES = '10:100'
    $VXLAN_GROUP = '224.0.0.1'

     
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
