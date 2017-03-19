class openstack-neutron::controller-ovs-operations inherits openstack-neutron::params {

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
    
    notify {"Creating ext bridge on network node":} ->
    exec {"Create external bridge":
        command => "ovs-vsctl --may-exist add-br ${EXTERNAL_BRIDGE}",
        user => "root",
    } ->

    notify {"Adding port to extnal bridge on network node":} ->
    exec {"Adding port to  external bridge":
        command => "ovs-vsctl --may-exist add-port ${EXTERNAL_BRIDGE} ${EXTERNAL_BRIDGE_INTERFACE}",
        user => "root",
    } ->

    notify {"Setting external bridge up": } ->
    exec {"Set external bridge up":
        command => "ip link set up ${EXTERNAL_BRIDGE}",
        user => "root",
    }
}
