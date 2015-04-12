class openstack-dashboard {

   notify {"Openstack Dashboard": } ->
   case $hostname {
         controller1, controller2, controller3: {
                class {'dashboard-installation':} ->
                class {'dashboard-operations':}
             }

   }

}
