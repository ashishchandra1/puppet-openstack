class rabbitmq-ha {
   case $hostname {
        openstack_controller1: {
                class {'rabbitmq-install':}
             }

        openstack_controller2, openstack_controller3: {
                class {'rabbitmq-install':} ->
                class {'rabbitmq-ha':}
              }
   }
}
