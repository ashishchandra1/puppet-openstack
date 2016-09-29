class openstack-cinder {
   case $hostname {
         demo_controller1: {
                class {'create-cinder-db':} ->
                class {'keystone':} ->
                class {'cinder-installation':} ->
                class {'cinder-db-sync':} ->
                class {'cinder-operations':}
             }

          demo_controller2, demo_controller3: {
                class {'cinder-installation':} ->
                class {'cinder-operations':}
              }
   }
}

