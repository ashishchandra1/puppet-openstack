class mariadb-galera::start-maria {

  #It runs mysql service on member of clustered nodes  except primary node
  notify {"Starting mariadb Service on member Nodes": } ->
# service { "mysql ":
  #ensure => "running",
  #exec{"/etc/init.d/mysql start":}
  exec{"service mysql start":}

}
