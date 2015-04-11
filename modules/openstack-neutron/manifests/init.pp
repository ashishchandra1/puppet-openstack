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

          neutron1,neutron2: {
                class {'neutron-compute-installation':} ->
                class {'neutron-compute-operations':}
              }
   }

}

