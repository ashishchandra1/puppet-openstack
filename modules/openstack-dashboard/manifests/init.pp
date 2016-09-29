class openstack-dashboard {

   notify {"Openstack Dashboard": } ->
   case $hostname {
         demo_controller1, demo_controller2, demo_controller3: {
                class {'dashboard-installation':} ->
                class {'dashboard-operations':}
             }

   }

}
