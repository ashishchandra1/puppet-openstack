class openstack-neutron::neutron-controller-installation {

     $NOVA_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = "controller"
     $NOVA_ADMIN_PORT = '8774'
     $ADMIN_USER = 'neutron'
     $ADMIN_PASSWORD = '@dmin123'
     $RABBIT_PASSWORD = '@dmin123' 

     $LOG_BOOL_VALUE = "True"
     $RABBIT_HOST = "controller"
     $MY_IP = "10.0.131.20"

     $packages = [ 
                 "openstack-neutron-api",
                 "openstack-neutron-cert",
                 "openstack-neutron-conductor",
                 "openstack-neutron-console",
                 "openstack-neutron-novncproxy",
                 "openstack-neutron-scheduler",
                 "python-neutronclient"
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
