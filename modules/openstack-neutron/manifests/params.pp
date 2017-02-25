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
    $RABBIT_HOSTS = "openstack_controller1:5672, openstack_controller2:5672, openstack_controller3:5672"
    $MEMCACHED_SERVERS = "openstack_controller1:11211, openstack_controller2:11211, openstack_controller3:11211"
     
    $admin_user_pass = "@dmin123"
    $region = "regionOne"

    $METADATA_SECRET = '@dmin123' 
    
    $MYSQL_ROOT_PASSWORD = '459nvDB91fWU'
    $NEUTRON_DB_PASSWORD = '3w550M3H32KO'
    $NEUTRON_DB_USER = 'neutron'
    $NEUTRON_DB_NAME = 'neutron'

    $PROVIDER_INTERFACE_NAME = 'team0.214'
    $OVERLAY_INTERFACE_IP_ADDRESS = $ipaddress

    # ml2 config parameters 
    $TENANT_NETWORK_TYPES = 'vlan'
    $MECHANISM_DRIVERS = 'openvswitch,linuxbridge'
    $NETWORK_VLAN_RANGES = 'physnet1:500:699,physnet2'
     
    $neutron_compute_packages = [
        "openstack-neutron-linuxbridge",
        "ebtables",
        "ipset"
    ]
    
    $neutron_controller_packages = [ 
        "openstack-neutron",
        "openstack-neutron-ml2",
        "openstack-neutron-linuxbridge",
        "ebtables",
        "which"
    ]
}
