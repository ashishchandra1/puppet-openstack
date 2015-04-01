
class mariadb-galera::start-sec {

   notify {"Initialized cluster on primary node":} ->
    exec {"Initialized cluster on primary node":
    path => ["/usr/bin/","/usr/sbin/","/bin"],
    command => "/etc/init.d/mysql start",
    user => 'root',
  }
}
