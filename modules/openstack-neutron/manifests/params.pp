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
    $RABBIT_HOSTS = "demo_controller1:5672, demo_controller2:5672, demo_controller3:5672"
    $MEMCACHED_SERVERS = "demo_controller1:11211, demo_controller2:11211, demo_controller3:11211"
     
    $admin_user_pass = "@dmin123"
    $region = "regionOne"

    $METADATA_SECRET = '@dmin123' 
    
    $MYSQL_ROOT_PASSWORD = '459nvDB91fWU'
    $NEUTRON_DB_PASSWORD = '3w550M3H32KO'
    $NEUTRON_DB_USER = 'neutron'
    $NEUTRON_DB_NAME = 'neutron'

    PROVIDER_INTERFACE_NAME=
    OVERLAY_INTERFACE_IP_ADDRESS= $ipaddress

    # ml2 config parameters 
    $TENANT_NETWORK_TYPES = 'vxlan'
    $MECHANISM_DRIVERS = 'linuxbridge,l2population'
     
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
