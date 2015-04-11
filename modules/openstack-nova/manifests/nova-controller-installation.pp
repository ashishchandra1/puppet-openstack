class openstack-nova::nova-controller-installation {

     $NOVA_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = "controller"
     $NOVA_HOST = $ipaddress
     $NOVA_ADMIN_PORT = '8774'
     $ADMIN_USER = 'nova'
     $ADMIN_PASSWORD = '@dmin123'
     $RABBIT_PASSWORD = '@dmin123' 

     $LOG_BOOL_VALUE = "True"
     $RABBIT_HOST = "controller"
     $MY_IP = "10.0.131.20"


     notify {"Installing Openstack Nova on Controller Nodes":} ->

     $packages = [ "openstack-nova-api", "openstack-nova-cert", "openstack-nova-conductor", "openstack-nova-console", "openstack-nova-novncproxy", "openstack-nova-scheduler", "python-novaclient"]
    
#Installing Packages
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
