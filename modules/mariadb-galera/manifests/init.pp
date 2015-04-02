class mariadb-galera {
    notify {"MariaDB Galera Cluster Primary Node Installation and Initialization": }
    case $hostname {
        controller1: {
               class  {'mariadb-galera::disable-selinux':} ->
               class  {'mariadb-galera::params':} ->
               class  {'mariadb-galera::install':} ->
               class {'mariadb-galera::start-maria':} ->
               class {'mariadb-galera::set-pass':}->
               class {'mariadb-galera::galera':} ->
               class {'mariadb-galera::stop-maria':}->
               class {'mariadb-galera::config' :} ->
               class {'mariadb-galera::start-maria-again' :}
       }
     }

 notify {"MariaDB Galera Cluster Member  Nodes Installation and Initialization": }
 case $hostname {  
   controller2,controller3:{
    #For installing MariaDB Galera Cluster on  member nodes
          class  {'mariadb-galera::disable-selinux':} ->
          class  {'mariadb-galera::params':} ->
          class {'mariadb-galera::install':} ->
          class {'mariadb-galera::start-maria':} ->
          class {'mariadb-galera::set-pass':} ->
          class {'mariadb-galera::galera':} ->
          class {'mariadb-galera::stop-maria':}->
          class {'mariadb-galera::config' :} ->
          class {'mariadb-galera::start-sec' :}  
      }
       }

 
}
