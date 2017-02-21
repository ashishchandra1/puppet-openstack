class openstack-keystone {

   notify {"Openstack keystone installation and Operations": } ->
   case $hostname {
         openstack_controller1: {
                class {'create-keystone-db':} ->
                class {'keystone-installation':} ->
                class {'keystone-db-sync':} ->
                class {'initiate-fernet':} ->
                class {'keystone-httpd-operations':} -> 
                class {'initiate-keystone':}
        }

          openstack_controller2, openstack_controller3: {
                class {'keystone-installation':} ->
                class {'keystone-httpd-operations':}                    
          }
   }
}
