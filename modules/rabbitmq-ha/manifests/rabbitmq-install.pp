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
    
    exec {'systemctl enable rabbitmq-server.service':} ->
    exec {'systemctl start rabbitmq-server.service':} ->
  
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

   exec {'systemctl restart rabbitmq-server.service':}
}
