class openstack-nova::nova-compute-installation {

     $NOVA_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = "controller"
     $NOVA_ADMIN_PORT = '8774'
     $ADMIN_USER = 'nova'
     $ADMIN_PASSWORD = '@dmin123'
     $RABBIT_PASSWORD = '@dmin123'
 
     $LOG_BOOL_VALUE = "True"
     $RABBIT_HOST = "controller"
     $MY_IP = $ipaddress
    
     $packages = [
              "openstack-nova-compute",
              "sysfsutils"
     ]
   
     notify {"Installing Openstack Nova on Compute Nodes":} ->
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
       content => template('openstack-nova/nova-compute/nova.conf.erb'),
   }

}
