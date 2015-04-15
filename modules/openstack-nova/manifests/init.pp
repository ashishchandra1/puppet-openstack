class openstack-nova {
   case $hostname {
         controller1: {
                #class {'keystone':} ->
                class {'nova-controller-installation':} ->
                #class {'nova-db-sync':} ->
                class {'nova-controller-operations':}
             }

          controller2,controller3: {
                class {'nova-controller-installation':} ->
                class {'nova-controller-operations':}
              }

          compute1,compute2: {
                class {'nova-compute::nova-compute-installation':} ->
                class {'nova-compute::nova-compute-operations':}
              }
   }

}

