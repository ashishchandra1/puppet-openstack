class openstack-keystone {

   notify {"Openstack Keystone runs on Primary node": } ->
   case $hostname {
         controller1: {
                class {'keystone':} -> 
                class {'keystone-installation':} ->
                class {'keystone-db-sync':} ->
                class {'initiate-keystone:}
             }

          controller2,controller3: {
                class {'keystone-installation':} ->
                class {'keystone-operations':}                    
              }
   }
}
