class haproxy-keepalived {
    notify {"MariaDB Galera Cluster Primary Node Installation and Initialization": }
    case $hostname {
        haproxy1: {
            class {'haproxy-keepalived::install_haproxy':} ->
            class {'haproxy-keepalived::install_keepalived_ha1':} ->
            class {'haproxy-keepalived::haproxy_keepalived_operations':}
        }

        haproxy2: {
            class {'haproxy-keepalived::install_haproxy':} ->
            class {'haproxy-keepalived::install_keepalived_ha2':} -> 
            class {'haproxy-keepalived::haproxy_keepalived_operations':}
        }
    }    
}
