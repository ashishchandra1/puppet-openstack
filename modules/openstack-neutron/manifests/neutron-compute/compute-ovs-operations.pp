class openstack-neutron::neutron-compute::compute-ovs-operations inherits openstack-neutron::params {
    
    notify {"Enable OVS Service on Compute Node":} ->
    exec {"Enabling OVS Services":
        command => "systemctl enable openvswitch.service",
        user => "root",
    } ->

    notify {"Start OVS Service on Compute Node":} ->
    exec {"Starting OVS Services":
        command => "systemctl start openvswitch.service", 
        user => "root",
    } ->

    notify {"Creating data bridge on compute node":} ->
    exec {"Create data bridge":
        command => "ovs-vsctl --may-exist add-br ${DATA_BRIDGE}",
        user => "root",
    } ->
  
    notify {"Adding port to data bridge on compute node":} ->
    exec {"Add port to data bridge":
        command => "ovs-vsctl --may-exist add-port ${DATA_BRIDGE} ${COMPUTE_DATA_INTERFACE}",
        user => "root",
    } ->

    notify {"Setting status of data bridge up": } ->
    exec {"Set data bridge up":
        command => "ip link set up ${DATA_BRIDGE}",
        user => "root",
    }
}
