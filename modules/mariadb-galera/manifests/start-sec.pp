
class mariadb-galera::start-sec {

   notify {"Initialized cluster on primary node":} ->
    exec {"Initialized cluster on primary node":
    #path => ["/usr/bin/","/usr/sbin/","/bin"],
    command => "service mysql start",
    user => 'root',
  }
}
