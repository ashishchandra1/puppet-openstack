class openstack-neutron::neutron-network::neutron-ovs-operations {
   $INTERFACE_NAME = enp0s8
    
    notify {"Enable OVS Service on Network Node":} ->
    exec {"Enabling OVS Services":
          command => 'systemctl enable openvswitch.service',
          user => 'root',
     } ->

     notify {"Start OVS Service on Network Node":} ->
     exec {"Starting OVS Services":
          command => 'systemctl start openvswitch.service', 
          user => 'root',
     } ->

     notify {"Add external bridge":} ->
     exec {"Adding external bridge":
          command => 'ovs-vsctl --may-exist add-br br-ex',
          user => 'root',
     } ->

     notify {"Add port to external bridge":} ->
     exec {"Adding port to external bridge":
          #command => 'ovs-vsctl --may-exist add-port br-ex ${INTERFACE_NAME}',
          command => 'ovs-vsctl add-port br-ex enp8s0.798',
          user => 'root',
     }

}
