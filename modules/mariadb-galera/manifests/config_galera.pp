class mariadb-galera::config_galera inherits mariadb-galera::params {
    include mariadb-galera::params
    require('mariadb-galera::params')
 
    notify {"Creating Galera Cluster users":} ->
    exec { "create-galera-cluster-user":
        command => "/usr/bin/mysql -uroot -p$mysql_root_password -e \"delete from mysql.user where user=''; grant all on *.* to 'root'@'%' identified by '$mysql_root_password'; grant usage on *.* to ${galera_db_user}@'%' identified by '$mysql_root_password'; grant all privileges on *.* to ${galera_db_user}@'%'; flush privileges;\"",
    } ->

    notify {"Stoping mariadb Service on member Nodes": } ->
    exec{"Stop mysql service":
        command =>"service mysql stop",
    } ->
    
    notify {"Injecting Cluster configuration file ":} ->
    file { '/etc/my.cnf.d/server.cnf':
        content => template('mariadb-galera/server.cnf.erb'),
        require  => Class['mariadb-galera::params'],
    } 
}
