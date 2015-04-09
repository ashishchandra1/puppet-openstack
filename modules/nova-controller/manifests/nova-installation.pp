class nova-controller::nova-installation {

     $NOVA_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = "controller"
     $NOVA_HOST = $ipaddress
     $NOVA_ADMIN_PORT = '8774'
     $ADMIN_TOKEN = '@dmin123'
     $RABBIT_PASS = '@dmin123' 
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
       content => template('nova-controller/nova.conf.erb'),
   }

}

