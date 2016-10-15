class rabbitmq-ha::rabbitmq-ha {
    exec {'start rabbitmq service on sec nodes':
         command => 'systemctl start rabbitmq-server.service',
         } ->
    exec {'Stop rabbitmq':
         command => 'rabbitmqctl stop_app'
         } ->
    exec {'join the rabbitmq to the cluster':
         command => 'rabbitmqctl join_cluster rabbit@demo_controller1'
         } ->
    exec {'Start rabbitmq':
         command => 'rabbitmqctl start_app'
         } ->
    exec {'Set ha mode for all queues':
         command => 'rabbitmqctl set_policy ha-all \'^(?!amq\.).*\' \'{"ha-mode": "all"}\''
         } ->
    exec {'restart rabbitmq service on sec nodes':
         command => 'systemctl restart rabbitmq-server.service'
    }
}
