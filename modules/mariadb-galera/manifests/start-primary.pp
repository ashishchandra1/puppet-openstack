
class mariadb-galera::start-primary {

    notify {"Initialized cluster on primary node":} ->
    exec {"Initialize cluster on primary node":
        command => "galera_new_cluster",
        user => 'root',
    }
}
