class openstack-glance {

   notify {"Openstack Glance installation and Operations": } ->
   case $hostname {
         openstack_controller1: {
                class {'create-glance-db':} ->
                class {'keystone_operations':} -> 
                class {'glance-installation':} ->
                class {'glance-db-sync':} ->
                class {'glance-operations':}
             }

          openstack_controller2, openstack_controller3: {
                class {'glance-installation':} ->
                class {'glance-operations':}                    
              }
   }
}
