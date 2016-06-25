class openstack-glance {

   notify {"Openstack keystone runs on Primary node": } ->
   case $hostname {
         controller1: {
                class {'create-glance-db':} ->
                class {'keystone_operations':} -> 
                class {'glance-installation':} ->
                class {'glance-db-sync':} ->
                class {'glance-operations':}
             }

          controller2,controller3: {
                class {'glance-installation':} ->
                class {'glance-operations':}                    
              }
   }
}
