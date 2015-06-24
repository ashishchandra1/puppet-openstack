
class mariadb-galera::start-primary {

    notify {"Initialized cluster on primary node":} ->
    exec {"Initialize cluster on primary node":
        command => "/etc/init.d/mysql start --wsrep-new-cluster",
        user => 'root',
    }
}
