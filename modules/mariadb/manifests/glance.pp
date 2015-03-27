class mariadb::glance {
     $mysql_password = '@dmin123'
     $db_user = 'glance'
     $db_name = 'glance'
     $db_password = '@dmin123'

     notify {"Creating a new glance database ":} ->
     exec { "create-${db_name}-db":
           unless => "/usr/bin/mysql -u${db_user} -p${db_password} ${db_name}",
           command => "/usr/bin/mysql -uroot -p$mysql_password -e \"create database ${db_name}; grant all privileges on ${db_name}.* to ${db_user}@localhost identified by '$db_password';\"",
      } ->

      exec { "Grant premissions to Glance User":
           unless => "/usr/bin/mysql -u${db_user} -p${db_password} ${db_name}",
           command => "/usr/bin/mysql -uroot -p$mysql_password -e \"grant all privileges on ${db_name}.* to ${db_user}@% identified by '$db_password';\"",
      }

}
