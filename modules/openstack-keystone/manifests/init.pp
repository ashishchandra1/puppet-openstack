class openstack-keystone {

   notify {"Openstack keystone installation and Operations": } ->
   case $hostname {
         controller1: {
                class {'keystone-installation':} ->
                class {'keystone-db-sync':} ->
                class {'keystone-operations':} -> 
                class {'initiate-keystone':}
             }

          controller2,controller3: {
                class {'keystone-installation':} ->
                class {'keystone-operations':}                    
              }
   }
}
