class openstack-cinder {
   case $hostname {
         openstack_controller1: {
                class {'create-cinder-db':} ->
                class {'keystone_operations':} ->
                class {'cinder-installation':} ->
                class {'cinder-db-sync':} ->
                class {'cinder-operations':}
             }

          openstack_controller2, openstack_controller3: {
                class {'cinder-installation':} ->
                class {'cinder-operations':}
              }
   }
}

