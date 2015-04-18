class openstack-neutron::neutron-controller-installation {

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
     $NOVA_ADMIN_USERNAME  = "nova"
     $NOVA_ADMIN_PASSWORD  = "@dmin123"
     
     $packages = [ 
                 "openstack-neutron",
                 "openstack-neutron-ml2",
                 "python-neutronclient",
                 "which"
    ]
    
     notify {"Installing Openstack Neutron on Controller Nodes":} ->
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
   } ->

   notify {"Putting Service ID in neutron.conf file":} ->
   file {"/tmp/get-nova-admin-tenant-id.sh":
        ensure =>file,
        owner =>root,
        content => template('openstack-neutron/neutron-controller/get-nova-tenant-service-id.sh'),
        mode => 755,
   } -> 

   notify {"Getting nova admin tenant id":} ->
   exec {"Nova admin tenant id":
             command => "bash /tmp/get-nova-admin-tenant-id.sh",
             user => 'root',
       }
}
