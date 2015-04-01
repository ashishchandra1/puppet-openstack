class openstack-glance {
<<<<<<< HEAD

   notify {"Openstack keystone runs on Primary node": } ->
   case $hostname {
         controller1: {
                class {'keystone':} -> 
                class {'glance-installation':} ->
                class {'glance-db-sync':} ->
                class {'glance-operations':}
             }

          controller2,controller3: {
                class {'keystone':} ->
                class {'glance-installation':} ->
                class {'glance-operations':}                    
              }
   }
   
=======
   class {'keystone':} -> 
   class {'glance-installation':} ->
   class {'glance-db-sync.pp'} ->
   class {'glance-operations:'}

>>>>>>> de0fddc279e1f26e88dfd90cad838831aab1db7c
}
