
class mariadb-galera::start-sec {

    notify {"Initialized cluster on secondary nodes":} ->
    exec {"Initialize cluster on secondary nodes":
        command => "service mysql start",
        user => 'root',
  }
}
