class openstack-neutron::neutron-controller-installation {

     $NEUTRON_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = "controller"
     $NEUTRON_ADMIN_PORT = '9696'
     $ADMIN_USER = 'neutron'
     $ADMIN_PASSWORD = '@dmin123'
     $RABBIT_PASSWORD = '@dmin123' 

     $LOG_BOOL_VALUE = "True"
     $RABBIT_HOST = "controller"
     $MY_IP = "10.0.131.20"
     $REGION = "regionOne"
     $NOVA_ADMIN_USERNAME  = "nova"
     $NOVA_ADMIN_PASSWORD  = "nova"
     
     $packages = [ 
                 "openstack-neutron",
                 "openstack-neutron-ml2",
                 "python-neutronclient",
                 "which"
    ]
    
     notify {"Installing Openstack Nova on Controller Nodes":} ->
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
       content => template('openstack-neutron/neutron-controller/neutron.conf.erb'),
   }
}
