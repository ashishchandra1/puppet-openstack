class mariadb-galera::galera {
     $mysql_password = '@dmin123'
     $galera_db_user = 'sst_user'
     $db_name = 'cinder'
     $db_password = '@dmin123'

     notify {"Creating Galera Cluster users":} ->
     exec { "create-galera-cluster-user":
           command => "/usr/bin/mysql -uroot -p$mysql_password -e \"delete from mysql.user where user=''; grant all on *.* to 'root'@'%' identified by '$db_password'; grant usage on *.* to ${galera_db_user}@'%' identified by '$db_password'; grant all privileges on *.* to ${galera_db_user}@'%'; flush privileges;\"",
      }

}
