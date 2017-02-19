class rabbitmq-ha::rabbitmq-install inherits rabbitmq-ha::params {

     notify {"Installing RabbitMQ Server":} ->
     package {
        $packages: 
        ensure =>installed,
     } ->
   
     notify {"Injecting .erlang.cookie for RabbitMQ clustering":} -> 
     file { '/var/lib/rabbitmq/.erlang.cookie':
         ensure  => file,
         owner  => rabbitmq,
         group  => rabbitmq,
         mode   => '400',
         content => template('rabbitmq-ha/erlang.cookie.erb'),
     } ->

    notify {"Enabling RabbitMQ service to start at reboot": } ->
    exec {"Enabling RabbitMQ":
        command => 'systemctl enable rabbitmq-server.service',
        user => 'root',
    } ->

    notify {"Starting RabbitMQ Service": } ->
    exec {"Starting RabbitMQ":
        command => 'systemctl start rabbitmq-server.service',
        user => 'root',
    } ->
    
    notify {"Add a new openstack user":}->  
    exec { "Adding a new user":
        command => "rabbitmqctl add_user  $RABBIT_USER $RABBIT_PASSWORD",
        logoutput => true,
    } ->
  
   notify {"Permit configuration, write and read access for openstack user":}->
   exec { "Adding permissions":
        command => "rabbitmqctl set_permissions $RABBIT_USER \".*\" \".*\" \".*\"",
        logoutput => true,
    } ->

   notify {"Restarting RabbitMQ Service to take changes": } ->
   exec {"Restarting RabbitMQ":
        command => 'systemctl restart rabbitmq-server.service',
        user => 'root',
   }
}
