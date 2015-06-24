class mariadb-galera::install_mariadb {
    $mysql_root_password = '@dmin123'
    $galera_db_user = 'sst_user'

    yumrepo { 'mariadb':
        baseurl         => "http://yum.mariadb.org/10.0/centos7-amd64",
        enabled         => '1',
        gpgcheck        => '1',
        gpgkey          => 'https://yum.mariadb.org/RPM-GPG-KEY-MariaDB',
        descr           => 'MariaDB Yum Repository',
    }

    $packages = [ 
        "MariaDB-Galera-server",
        "MariaDB-client",
        "rsync",
        "galera",
        "socat"
    ]

    notify {"Set SELINUX in permissive mode": } ->
    exec {"selinux permissive":
        command => "setenforce 0",
        user => 'root',
    } ->

    notify {"Installing Maria DB and galera packages ":} ->
    package {
        $packages: 
        ensure =>installed,
    } ->
   
    notify {"Starting Mariadb Service": } ->
    exec{"Starting Mariadb":
        command => 'service mysql start',
        user => 'root',
    } ->

    notify{"Create mysql-autosecure script":} ->
    file { "mysql-autosecure":
        path => "/usr/local/src/mysql-autosecure.sh",
        source => "puppet:///modules/mariadb-galera/mysql-autosecure.sh",
        mode => 0755,
    } ->
    
    notify{"Execute mysql-autosecure script":} ->
    exec { "mysql-autosecure":
        command => "bash /usr/local/src/mysql-autosecure.sh $mysql_root_password",
    } ->

    notify {"Creating Galera Cluster users":} ->
    exec { "create-galera-cluster-user":
        command => "/usr/bin/mysql -uroot -p$mysql_root_password -e \"delete from mysql.user where user=''; grant all on *.* to 'root'@'%' identified by '$mysql_root_password'; grant usage on *.* to ${galera_db_user}@'%' identified by '$mysql_root_password'; grant all privileges on *.* to ${galera_db_user}@'%'; flush privileges;\"",
    }    
}
