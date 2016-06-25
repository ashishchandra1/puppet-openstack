class openstack-nova {
   case $hostname {
         controller1: {
                class {'create-nova-db':} -> 
                class {'keystone_operations':} ->
                class {'nova-controller-installation':} ->
                class {'nova-db-sync':} ->
                class {'nova-controller-operations':}
             }

          controller2, controller3: {
                class {'nova-controller-installation':} ->
                class {'nova-controller-operations':}
              }

          compute1, compute2, compute3, compute4, compute5, compute6, compute7, compute8, compute9: {
                class {'nova-compute::nova-compute-installation':} ->
                class {'nova-compute::nova-compute-operations':}
              }
   }
}

