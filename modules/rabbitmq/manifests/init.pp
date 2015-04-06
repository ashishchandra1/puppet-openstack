class rabbitmq {
     #TODO:hard coded password sucks
     $rabbit_password = '@dmin123'
     notify {"Installing RabbitMQ Server":} ->
     package { ['rabbitmq-server']:
          ensure => present,
     } ->
   
    exec {'systemctl enable rabbitmq-server.service':} ->
    exec {'systemctl start rabbitmq-server.service':} ->
    
    exec { "rabbitmqctl":
        command => "rabbitmqctl change_password guest $rabbit_password",
        logoutput => true,
    } ->
    
   exec {'systemctl restart rabbitmq-server.service':}
}
