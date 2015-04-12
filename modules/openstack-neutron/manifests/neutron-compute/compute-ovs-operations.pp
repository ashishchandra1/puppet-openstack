class openstack-neutron::neutron-compute::compute-ovs-operations {
    
    notify {"Enable OVS Service on Compute Node":} ->
    exec {"Enabling OVS Services":
          command => 'systemctl enable openvswitch.service',
          user => 'root',
     } ->

     notify {"Start OVS Service on Compute Node":} ->
     exec {"Starting OVS Services":
          command => 'systemctl start openvswitch.service', 
          user => 'root',
     }
}
