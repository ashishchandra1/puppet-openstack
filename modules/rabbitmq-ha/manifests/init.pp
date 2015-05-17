class rabbitmq-ha {
   case $hostname {
         controller1: {
                class {'rabbitmq-install':}
             }

          controller2,controller3: {
                class {'rabbitmq-install':} ->
                class {'rabbimq-ha':}
              }

   }

}
