class openstack-neutron::neutron-compute::neutron-compute-operations {

    notify {"Creating Symbolic link on Compute Node":} ->
    
    file {'/etc/neutron/plugin.ini':
        ensure => link,
        target => '/etc/neutron/plugins/ml2/ml2_conf.ini',  
    } ->

    notify{"Copy files on Compute Node to resolve packaging bug":} ->
    exec {"Copy files on Compute Node":
        command =>'cp /usr/lib/systemd/system/neutron-openvswitch-agent.service \
                   /usr/lib/systemd/system/neutron-openvswitch-agent.service.orig',
        user => 'root',
    } ->
   
    notify{"Find and Replace to resolve packaging bug":}->
    exec {"Find and Replace on Compute Node":
        command =>"sed -i 's,plugins/openvswitch/ovs_neutron_plugin.ini,plugin.ini,g' \
                    /usr/lib/systemd/system/neutron-openvswitch-agent.service",
        user =>'root',
    } ->

    notify {"Restart Compute Service":} ->
    exec {"Restarting Compute Service":
        command => 'systemctl restart openstack-nova-compute.service',
        user => 'root',
    } ->

    notify {"Enable OVS agent on Compute Node":} ->
    exec {"Enabling OVS agent":
        command => 'systemctl enable neutron-openvswitch-agent.service',
        user => 'root',
    } ->

    notify {"Start OVS agent on Compute Node":} ->
    exec {"Starting OVS agent":
        command => 'systemctl start neutron-openvswitch-agent.service',
        user => 'root',
    } 
}
