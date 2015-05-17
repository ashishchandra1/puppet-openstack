class rabbitmq-ha::rabbitmq-install {
     $rabbit_password = '@dmin123'
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
    
    exec {'systemctl enable rabbitmq-server.service':} ->
    exec {'systemctl start rabbitmq-server.service':} ->
    
    exec { "rabbitmqctl":
        command => "rabbitmqctl change_password guest $rabbit_password",
        logoutput => true,
    } ->

   exec {'systemctl restart rabbitmq-server.service':}
}
