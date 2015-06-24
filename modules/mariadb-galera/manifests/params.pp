class mariadb-galera::params {
    $mysql_root_password = '@dmin123'
    $galera_db_user = 'sst_user'
    $HOST_IP                = $ipaddress 
    $HOSTNAME               = $hostname
    $DBPASS                 = "@dmin123"
    $CLUSTER_MEMBERS_LIST   = "10.0.131.10,10.0.131.11,10.0.131.14" 

    $packages = [ 
        "MariaDB-Galera-server",
        "MariaDB-client",
        "rsync",
        "galera",
        "expect",
        "socat"
    ]
 }
