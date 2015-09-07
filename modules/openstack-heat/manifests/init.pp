class openstack-heat {

   notify {"Openstack keystone runs on Primary node": } ->
   case $hostname {
         controller1: {
                class {'create-heat-db':} ->
                class {'keystone':} ->
                class {'heat-installation':} ->
                class {'heat-db-sync':} ->
                class {'heat-operations':}
             }

          controller2,controller3: {
                class {'heat-installation':} ->
                class {'heat-operations':}
              }
   }
}
