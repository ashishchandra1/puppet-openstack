class mariadb::nova_controller {
     $mysql_password = '@dmin123'
     $db_user = 'nova'
     $db_name = 'nova'
     $db_password = '@dmin123'

     notify {"Creating a new nova database ":} ->
     exec { "create-${db_name}-db":
           unless => "/usr/bin/mysql -u${db_user} -p${db_password} ${db_name}",
           command => "/usr/bin/mysql -uroot -p$mysql_password -e \"create database ${db_name}; grant all privileges on ${db_name}.* to ${db_user}@localhost identified by '$db_password';\"",
      } ->

      exec { "grant-premissions on nova tables":
           unless => "/usr/bin/mysql -u${db_user} -p${db_password} ${db_name}",
           command => "/usr/bin/mysql -uroot -p$mysql_password -e \"grant all privileges on ${db_name}.* to ${db_user}@% identified by '$db_password';\"",
      }

}
