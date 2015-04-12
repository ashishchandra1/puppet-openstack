class openstack-neutron {
   case $hostname {
         controller1: {
                class {'keystone':} ->
                class {'neutron-controller-installation':} ->
                class {'neutron-ml2-config':} ->
                class {'configure-compute':} -> 
                class {'neutron-db-sync':} ->
                class {'neutron-controller-operations':}
             }

          controller2,controller3: {
                class {'neutron-controller-installation':} ->
                class {'neutron-ml2-config':} ->
                class {'configure-compute':} ->
                class {'neutron-controller-operations':}
              }

          network: {
                notify{"I reached here":} ->
                class {'neutron-network::neutron-network-installation':}
                #class {'neutron-network::neutron-network-config':} ->
                #class {'neutron-network::neutron-ovs-operations':} ->
                #class {'neutron-network::neutron-network-operations':}
              }
   }

}
