class openstack-neutron::neutron-network-installation {

     $NEUTRON_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = "controller"
     $NEUTRON_ADMIN_PORT = '9696'
     $ADMIN_USER = 'neutron'
     $ADMIN_PASSWORD = '@dmin123'
     $RABBIT_PASSWORD = '@dmin123'
 
     $LOG_BOOL_VALUE = "True"
     $RABBIT_HOST = "controller"
     $MY_IP = $ipaddress
    
     $packages = [
              "openstack-neutron",
              "openstack-neutron-ml2",
              "openstack-neutron-openvswitch"
     ]
   
     notify {"Installing Openstack Nova on Compute Nodes":} ->
#Installing Packages
     package {
          $packages: 
          ensure =>installed,
    } -> 

   notify {"CREATING neutron.conf FILE":} ->
   file { "/etc/neutron/neutron.conf":
       ensure  => file,
       owner  => root,
       group  => neutron,
       content => template('openstack-neutron/neutron-network/neutron.conf.erb'),
   }

}
