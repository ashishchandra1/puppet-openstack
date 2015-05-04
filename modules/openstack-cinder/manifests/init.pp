class openstack-cinder {
   case $hostname {
         controller1: {
                #class {'keystone':} ->
                class {'cinder-installation':} ->
                #class {'cinder-db-sync':} ->
                class {'cinder-operations':}
             }

          controller2,controller3: {
                class {'cinder-installation':} ->
                class {'cinder-operations':}
              }
   }
}

