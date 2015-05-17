class rabbitmq-ha::rabbitmq-ha {
    exec {'systemctl start rabbitmq-server.service':} ->
    exec {'rabbitmqctl stop_app':} ->
    exec {'rabbitmqctl join_cluster rabbit@controller1':} ->
    exec {'rabbitmqctl start_app':} ->
    exec {'systemctl restart rabbitmq-server.service':}
}
