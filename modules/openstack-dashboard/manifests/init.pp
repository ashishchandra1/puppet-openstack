class openstack-dashboard {

   notify {"Openstack Dashboard": } ->
   case $hostname {
         openstack_controller1, openstack_controller2, openstack_controller3: {
                class {'dashboard-installation':} ->
                class {'dashboard-operations':}
             }
   }

}
