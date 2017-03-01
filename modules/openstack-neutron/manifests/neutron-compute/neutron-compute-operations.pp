class openstack-neutron::neutron-compute::neutron-compute-operations {

    notify {"Restart Compute Service":} ->
    exec {"Restarting Compute Service":
        command => 'systemctl restart openstack-nova-compute.service',
        user => 'root',
    } ->

    notify {"Enable Neutron Openvswitch agent service on Compute Node":} ->
    exec {"Enabling Neutron Openvswitch agent service on Compute Node":
        command => 'systemctl enable neutron-openvswitch-agent.service',
        user => 'root',
    } ->

    notify {"Restart Neutron Openvswitch agent service on Compute Node":} ->
    exec {"Restarting Neutron Openvswitch agent service on Compute node":
        command => 'systemctl restart neutron-openvswitch-agent.service',
        user => 'root',
    } 
}
