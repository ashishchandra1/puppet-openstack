class mariadb::test {
     $mysql_password = '@dmin123'
     $user = 'keystone'
     $name1 = 'chandra'
     $password = 'chandra'

  notify {"Creating a new database ":} ->
       exec { "create-${name1}-db":
           #unless => "/usr/bin/mysql -u${user} -p${password} ${name1}",
           command => "/usr/bin/mysql -uroot -p$mysql_password -e \"create database ${name1}; grant all on ${name1}.* to ${user}@localhost identified by '$password';\"",
          #require => Service["mysqld"],
      }

}
