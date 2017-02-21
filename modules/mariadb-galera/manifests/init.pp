class mariadb-galera {
    notify {"MariaDB Galera Cluster Primary Node Installation and Initialization": }
    case $hostname {
        openstack_controller1: {
            class {'mariadb-galera::install_mariadb':} ->
            class {'mariadb-galera::config_galera':} ->
            class {'mariadb-galera::start-primary':}
        }
    }

    notify {"MariaDB Galera Cluster Member  Nodes Installation and Initialization": }
    case $hostname {  
        openstack_controller2, openstack_controller3:{
            class {'mariadb-galera::install_mariadb':} ->
            class {'mariadb-galera::config_galera':} ->
            class {'mariadb-galera::start-sec' :}  
        }
    }
}
