class mariadb-galera::start-maria-again {

  #It runs mysql service on member of clustered nodes  except primary node
  notify {"Starting mariadb Service again on member Nodes": } ->
# service { "mysql ":
  #ensure => "running",
  exec{"/etc/init.d/mysql start --wsrep-new-cluster":}

}
