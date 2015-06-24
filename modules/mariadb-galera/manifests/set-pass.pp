class mariadb-galera::set-pass {
     $mysql_password = '@dmin123'

    notify{"Create mysql-autosecure script":} ->
    file { "mysql-autosecure":
        path => "/usr/local/src/mysql-autosecure.sh",
        source => "puppet:///modules/mariadb-galera/mysql-autosecure.sh",
        mode => 0755,
    } ->
    
    notify{"Execute mysql-autosecure script":} ->
    exec { "mysql-autosecure":
        command => "bash /usr/local/src/mysql-autosecure.sh $mysql_password",
    }

}
    

