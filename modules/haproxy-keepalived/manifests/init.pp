class haproxy-keepalived {
    notify {"Haproxy KeepAlived Installation and Initialization": }
    case $hostname {
        openstack_haproxy1: {
            class {'haproxy-keepalived::install_haproxy':} ->
            class {'haproxy-keepalived::install_keepalived_ha1':} ->
            class {'haproxy-keepalived::haproxy_keepalived_operations':}
        }

        openstack_haproxy2: {
            class {'haproxy-keepalived::install_haproxy':} ->
            class {'haproxy-keepalived::install_keepalived_ha2':} -> 
            class {'haproxy-keepalived::haproxy_keepalived_operations':}
        }
    }    
}
