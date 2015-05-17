class openstack-neutron {
   case $hostname {
         controller1: {
                class {'create-neutron-db':} ->
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

          network1, network2: {
                class {'neutron-network::neutron-network-installation':} ->
                class {'neutron-network::neutron-network-config':} ->
                class {'neutron-network::neutron-ovs-operations':} ->
                class {'neutron-network::neutron-network-operations':}
              }
          
          compute1, compute2: {
                class {'neutron-compute::neutron-compute-installation':} ->
                class {'neutron-compute::neutron-compute-config':} ->
                class {'neutron-compute::compute-ovs-operations':} ->
                class {'neutron-compute::neutron-compute-operations':}
          }
   }

}
