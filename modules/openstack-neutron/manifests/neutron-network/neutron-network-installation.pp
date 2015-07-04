class openstack-neutron::neutron-network::neutron-network-installation inherits openstack-neutron::params {

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
          $neutron_network_packages: 
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
