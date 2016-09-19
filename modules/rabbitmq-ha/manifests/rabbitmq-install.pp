class rabbitmq-ha::rabbitmq-install {
     $RABBIT_USER = 'openstack'
     $RABBIT_PASSWORD = '2v04VsaRkZfr'

     notify {"Installing RabbitMQ Server":} ->
     package { ['rabbitmq-server']:
          ensure => present,
     } ->
   
    file { "/var/lib/rabbitmq/.erlang.cookie":
         ensure  => file,
         owner  => rabbitmq,
         group  => rabbitmq,
         mode   => '400',
         content => template('rabbitmq-ha/erlang.cookie.erb'),
    } ->

    notify {"Enabling Rabbitmq Service":} ->
    exec {"Enable Rabbitmq Services":
        command => 'systemctl enable rabbitmq-server.service',
        user => 'root',
    } ->

    notify {"Starting Rabbitmq Service":} ->
    exec {"Start Rabbitmq Services":
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

   notify {"Retarting Rabbitmq Service":} ->
   exec {"Restart Rabbitmq Services":
        command => 'systemctl restart rabbitmq-server.service',
        user => 'root',
    }
}
