class openstack-neutron::neutron-compute::neutron-compute-operations {

    notify {"Restart Compute Service":} ->
    exec {"Restarting Compute Service":
        command => 'systemctl restart openstack-nova-compute.service',
        user => 'root',
    } ->

    notify {"Enable Linux Bridge agent on Compute Node":} ->
    exec {"Enabling Linux Brige agent":
        command => 'systemctl enable neutron-linuxbridge-agent.service',
        user => 'root',
    } ->

    notify {"Start Linux Bridge agent on Compute Node":} ->
    exec {"Starting Linux Brige agent":
        command => 'systemctl restart neutron-linuxbridge-agent.service',
        user => 'root',
    } 
}
