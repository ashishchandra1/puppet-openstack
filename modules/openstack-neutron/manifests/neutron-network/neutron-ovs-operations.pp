class openstack-neutron::neutron-network::neutron-ovs-operations {
    
    notify {"Enable OVS Service on Network Node":} ->
    exec {"Enabling OVS Services":
        command => 'systemctl enable openvswitch.service',
        user => 'root',
    } ->

    notify {"Start OVS Service on Network Node":} ->
    exec {"Starting OVS Services":
        command => 'systemctl start openvswitch.service', 
        user => 'root',
     }
}
