class openstack-nova::nova-compute-installation {

     $NOVA_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = "controller"
     $NOVA_HOST = $ipaddress
     $NOVA_ADMIN_PORT = '8774'
     $ADMIN_TOKEN = '@dmin123'
     $RABBIT_PASS = '@dmin123' 
     notify {"Installing Openstack Nova on Compute Nodes":} ->

     $packages = [ "openstack-nova-compute", "sysfsutils"]
    
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
