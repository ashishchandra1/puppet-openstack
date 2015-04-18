class openstack-nova::nova-controller-installation {

     $NOVA_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = "controller"
     $NOVA_ADMIN_PORT = '8774'
     $ADMIN_USER = 'nova'
     $ADMIN_PASSWORD = '@dmin123'
     $RABBIT_PASSWORD = '@dmin123' 

     $VERBOSE = "True"
     $RABBIT_HOSTS = "controller1:5672,controller2:5672,controller3:5672"
     $MY_IP = "10.0.129.20"

     $packages = [ 
                 "openstack-nova-api",
                 "openstack-nova-cert",
                 "openstack-nova-conductor",
                 "openstack-nova-console",
                 "openstack-nova-novncproxy",
                 "openstack-nova-scheduler",
                 "python-novaclient"
    ]
    
     notify {"Installing Openstack Nova on Controller Nodes":} ->
     package {
          $packages: 
          ensure =>installed,
    } -> 

   notify {"CREATING nova.conf FILE":} ->
   file { "/etc/nova/nova.conf":
       ensure  => file,
       owner  => root,
       group  => nova,
       content => template('openstack-nova/nova-controller/nova.conf.erb'),
   }

}
