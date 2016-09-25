class openstack-keystone {

   notify {"Openstack keystone installation and Operations": } ->
   case $hostname {
         demo_controller1: {
                class {'create-keystone-db':} ->
                class {'keystone-installation':} ->
                class {'keystone-db-sync':} ->
                class {'keystone-httpd-operations':} -> 
                class {'initiate-keystone':}
        }

          demo_controller2, demo_controller3: {
                class {'keystone-installation':} ->
                class {'keystone-httpd-operations':}                    
          }
   }
}
