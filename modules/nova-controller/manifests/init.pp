class nova-controller {
   case $hostname {
         controller1: {
                class {'keystone':} ->
                class {'nova-installation':} ->
                class {'nova-db-sync':} ->
                class {'nova-operations':}
             }

          controller2,controller3: {
                class {'nova-installation':} ->
                class {'nova-operations':}
              }
   }
}

