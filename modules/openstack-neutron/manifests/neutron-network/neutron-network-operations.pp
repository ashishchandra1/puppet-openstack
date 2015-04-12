class openstack-neutron::neutron-network::neutron-network-operations {

   notify{"Copy files":} ->
   exec {"Copy files":
        command =>'cp /usr/lib/systemd/system/neutron-openvswitch-agent.service \
  /usr/lib/systemd/system/neutron-openvswitch-agent.service.orig',
        user => 'root',
   } ->
   
   notify{"Find and Replace":}->
   exec {"Find and Replace":
        command =>"sed -i 's,plugins/openvswitch/ovs_neutron_plugin.ini,plugin.ini,g' \
  /usr/lib/systemd/system/neutron-openvswitch-agent.service",
        user =>'root',
   } ->

    notify {"Enable Neutron Services on Network Node":} ->
    exec {"Enabling Neutron Services":
          command => 'systemctl enable neutron-openvswitch-agent.service \
                      neutron-l3-agent.service neutron-dhcp-agent.service \
                      neutron-metadata-agent.service neutron-ovs-cleanup.service',
          user => 'root',
     } ->

     notify {"Start Neutron Services on Network Node":} ->
     exec {"Starting neutron Services":
          command => 'systemctl start neutron-openvswitch-agent.service \
          neutron-l3-agent.service neutron-dhcp-agent.service \
          neutron-metadata-agent.service neutron-ovs-cleanup.service',
          user => 'root',
     }

}
