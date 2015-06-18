class openstack-neutron::neutron-network::neutron-network-installation {

    $NEUTRON_DBPASS = '@dmin123'
    $CONTROLLER_HNAME = "controller"
    $NEUTRON_ADMIN_PORT = '9696'
    $ADMIN_USER = 'neutron'
    $ADMIN_PASSWORD = '@dmin123'
    $RABBIT_PASSWORD = '@dmin123'
 
    $VERBOSE = "True"
    $RABBIT_HOSTS = "controller1:5672,controller2:5672,controller3:5672"
    
    $packages = [
        "openstack-neutron",
        "openstack-neutron-ml2",
        "openstack-neutron-openvswitch"
    ]
  
    notify {"Configure kernel networking parameter":} ->
    file { "/etc/sysctl.conf":
        ensure  => file,
        owner  => root,
        content => template('openstack-neutron/neutron-network/sysctl.conf.erb')
    } ->
     
    exec {"Configure kernel networking":
        command =>"sysctl -p",
        user => 'root',
    } -> 

    notify {"Installing Openstack Neutron on Network Nodes":} ->
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
