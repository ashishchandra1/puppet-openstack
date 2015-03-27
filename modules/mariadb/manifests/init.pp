class mariadb {
     #TODO:hard coded password sucks
     $mysql_password = 'ashish'
     notify {"Installing MariaDB packages":} ->
     package { ['mariadb', 'mariadb-server', 'MySQL-python']:
          ensure => present,
     } ->
   
    file { "/etc/my.cnf":
         ensure  => file,
         owner  => root,
         content => template('mariadb/my.cnf.erb'),
     } ->

    exec {'systemctl enable mariadb.service':} ->
    exec {'systemctl start mariadb.service':} ->
  
    file { "mysql-autosecure":
        path => "/usr/local/src/mysql-autosecure.sh",
        source => "puppet:///modules/mariadb/mysql-autosecure.sh",
    } ->

    exec { "mysql-autosecure":
        command => "sh /usr/local/src/mysql-autosecure.sh $mysql_password",
        path => "/usr/bin:/bin/",
        creates => "/usr/bin/mysql_secure_installation.ran",
        logoutput => true,
        require => File["mysql-autosecure"]
    }

}
