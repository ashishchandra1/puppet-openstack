class openstack-neutron::params {
	
    $NEUTRON_DBPASS = '@dmin123'
    $CONTROLLER_HNAME = "controller"
    $NEUTRON_ADMIN_PORT = '9696'
    $ADMIN_USER = 'neutron'
    $ADMIN_PASSWORD = '@dmin123'
    $RABBIT_PASSWORD = '@dmin123' 

    $KEYSTONE_HOST = "controller"
    $KEYSTONE_ADMIN_PORT = '35357'
    $ADMIN_TOKEN = '@dmin123'
    $VERBOSE = "True"
    $RABBIT_HOSTS = "controller1:5672,controller2:5672,controller3:5672"
    $MY_IP = "10.0.129.20"
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