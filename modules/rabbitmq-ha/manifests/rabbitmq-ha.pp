class rabbitmq-ha::rabbitmq-ha inherits rabbitmq-ha::params {
     
     notify {"Stopping RabbitMQ Service on secondary nodes to add to the cluster": } ->
     exec {"Stopping RabbitMQ for joining the cluster":
          command => "rabbitmqctl stop_app",
          user => 'root',
      } ->

      notify {"Join the node into RabbitMQ Cluster": } ->
      exec {"Joining RabbitMQ to the master node to form cluster as a RAM Node":
          command => "rabbitmqctl join_cluster rabbit@$RABBIT_MASTER_NODE --ram",
          user => 'root',
      } ->

      notify {"Starting RabbitMQ Service on secondary nodes after adding to the cluster": } ->
      exec {"Starting RabbitMQ after successful join to the cluster":
          command => "rabbitmqctl start_app",
          user => 'root',
      } ->

      notify {"Set HA mode for all queues": } ->
      exec {"Setting HA mode for all queues ":
          command => 'rabbitmqctl set_policy ha-all \'^(?!amq\.).*\' \'{"ha-mode": "all"}\'',
          user => 'root',
      } ->

      notify {"Restarting RabbitMQ Service": } ->
      exec {"Restarting RabbitMQ on secondary nodes":
          command => "systemctl restart rabbitmq-server.service",
          user => 'root',
      }
}
