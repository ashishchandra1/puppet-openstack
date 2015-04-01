class mariadb-galera::stop-maria {

  #It runs mysql service on member of clustered nodes  except primary node
  notify {"Stoping mariadb Service on member Nodes": } ->
  #service { "mysql ":
  #ensure => "stopped",
  exec{"service mysql stop":}
  

}
