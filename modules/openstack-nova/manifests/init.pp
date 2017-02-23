class openstack-nova {
   case $hostname {
         openstack_controller1: {
                class {'create-nova-db':} -> 
                class {'keystone_operations':} ->
                class {'nova-controller-installation':} ->
                class {'nova-db-sync':} ->
                class {'nova-controller-operations':}
             }

          openstack_controller2, openstack_controller3: {
                class {'nova-controller-installation':} ->
                class {'nova-controller-operations':}
              }

          openstack_compute1, openstack_compute2, openstack_compute3, openstack_compute4, openstack_compute5: {
                class {'nova-compute::nova-compute-installation':} ->
                class {'nova-compute::nova-compute-operations':}
              }
   }
}

