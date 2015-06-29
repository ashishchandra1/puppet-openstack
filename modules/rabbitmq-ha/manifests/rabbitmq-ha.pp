class rabbitmq-ha::rabbitmq-ha {
    exec {'start rabbitmq service on sec nodes':
         command => 'systemctl start rabbitmq-server.service',
         } ->
    exec {'rabbitmqctl stop_app':} ->
    exec {'rabbitmqctl join_cluster rabbit@controller1':} ->
    exec {'rabbitmqctl start_app':} ->
    exec {'rabbitmqctl set_policy ha-all '^(?!amq\.).*' '{"ha-mode": "all"}'':} ->
    exec {'restart rabbitmq service on sec nodes':
         command => 'systemctl restart rabbitmq-server.service'
    }
}
