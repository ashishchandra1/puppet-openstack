class openstack-neutron::neutron-network::neutron-ovs-operations inherits openstack-neutron::params {

    notify {"Enable OVS Service on Network Node":} ->
    exec {"Enabling OVS Services":
        command => "systemctl enable openvswitch.service",
        user => "root",
    } ->

    notify {"Start OVS Service on Network Node":} ->
    exec {"Starting OVS Services":
        command => "systemctl start openvswitch.service", 
        user => "root",
    } ->
    
    notify {"Creating data bridge on network node":} ->
    exec {"Create data bridge":
        command => "ovs-vsctl --may-exist add-br ${DATA_BRIDGE}",
        user => "root",
    } ->

    notify {"Creating ext bridge on network node":} ->
    exec {"Create external bridge":
        command => "ovs-vsctl --may-exist add-br ${EXT_BRIDGE}",
        user => "root",
    } ->

    notify {"Adding port to data bridge on network node":} ->
    exec {"Add port to data bridge bridge":
        command => "ovs-vsctl --may-exist add-port ${DATA_BRIDGE} ${NETWORK_DATA_INTERFACE}",
        user => "root",
    } ->
 
    notify {"Adding port to extnal bridge on network node":} ->
    exec {"Adding port to  external bridge":
        command => "ovs-vsctl --may-exist add-port ${EXT_BRIDGE} ${NETWORK_EXT_INTERFACE}",
        user => "root",
    } ->

    notify {"Setting data bridge up": } ->
    exec {"Set data bridge up":
        command => "ip link set up ${DATA_BRIDGE}",
        user => "root",
    } ->

    notify {"Setting external bridge up": } ->
    exec {"Set external bridge up":
        command => "ip link set up ${EXT_BRIDGE}",
        user => "root",
    }
}
