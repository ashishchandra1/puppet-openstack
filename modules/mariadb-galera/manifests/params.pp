class mariadb-galera::params {
    $MYSQL_ROOT_PASSWORD    = '459nvDB91fWU'
    $GALERA_DB_USER         = 'sst_user'
    $HOST_IP                = $ipaddress 
    $HOSTNAME               = $hostname
    $GALERA_DB_PASSWORD     = '9Rp2491E3n9L'
    $CLUSTER_MEMBERS_LIST   = "192.168.212.14,192.168.212.12,192.168.212.13" 

    $packages = [ 
        "MariaDB-Galera-server",
        "MariaDB-client",
        "rsync",
        "galera",
        "expect",
        "socat"
    ]
 }
