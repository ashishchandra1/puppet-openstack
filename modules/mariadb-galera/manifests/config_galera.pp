class mariadb-galera::config_galera inherits mariadb-galera::params {
    include mariadb-galera::params
    require('mariadb-galera::params')
 
    notify {"Creating Galera Cluster users":} ->
    exec { "create-galera-cluster-user":
        command => "/usr/bin/mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \"delete from mysql.user where user=''; grant all on *.* to 'root'@'%' identified by '$MYSQL_ROOT_PASSWORD'; grant usage on *.* to ${GALERA_DB_USER}@'%' identified by '$MYSQL_ROOT_PASSWORD'; grant all privileges on *.* to ${GALERA_DB_USER}@'%'; flush privileges;\"",
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
