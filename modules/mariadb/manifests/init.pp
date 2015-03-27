class mariadb {
   notify {"Installing MariaDB packages":} ->
   package { ['mariadb', 'mariadb-server', 'MySQL-python']:
       ensure => installed,
   } ->
   
  file { "/etc/my.cnf":
    ensure  => file,
    owner  => root,
    content => template('mariadb/my.cnf.erb'),
   } 

}
