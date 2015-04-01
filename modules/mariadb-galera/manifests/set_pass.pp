class mariadb-galera::set_pass {
     $mysql_password = '@dmin123'

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
    

