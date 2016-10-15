class rabbitmq-ha {
   case $hostname {
        demo_controller1: {
                class {'rabbitmq-install':}
             }

          demo_controller2, demo_controller3: {
                class {'rabbitmq-install':} ->
                class {'rabbitmq-ha':}
              }
   }
}
