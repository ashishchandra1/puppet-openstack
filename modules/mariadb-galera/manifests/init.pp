# == Class: galera
#
# This class installs mariaDB Galera Cluster.
# === Authors
#
# Author Name <aamir-araza@gmail.com>
#
# === Copyright
#
# Copyright 2015 aamir-raza
#
class mariadb-galera {

  #TODO Needs list of IP ADDRESSES FOR GALERA CLUSTER PRIMARY AS WELL AS SECONDARY NODES
  #For installing MariaDB Galera Cluster on Primay node
  #TODO THIS FLOW LOCKS FOR PRIMARY CLUSTER

 notify {"MariaDB Galera Cluster Primary Node Installation and Initialization": }
 case $hostname {
   controller1: {
   class  {'mariadb-galera::setting' :} ->
   class  {'mariadb-galera::params' :} ->
   class {'mariadb-galera::packages' :} ->
   class {'mariadb-galera::members':} ->
   class {'mariadb-galera::set_pass':}->
   class {'mariadb-galera::galera':} ->
   class {'mariadb-galera::stop_maria':}->
   class {'mariadb-galera::config' :} ->
   class {'mariadb-galera::primary' :}
       }
     }
 notify {"MariaDB Galera Cluster Member  Nodes Installation and Initialization": }
 case $hostname {  
   controller2,controller3:{
    #For installing MariaDB Galera Cluster on  member nodes
   class  {'mariadb-galera::setting' :} ->
   class  {'mariadb-galera::params' :} ->
   class {'mariadb-galera::packages' :} ->
   class {'mariadb-galera::stop_maria':}->
   class {'mariadb-galera::members':} ->
   class {'mariadb-galera::set_pass':} ->
   class {'mariadb-galera::galera':} ->
   class {'mariadb-galera::stop_maria':}->
   class {'mariadb-galera::config' :} ->
   class {'mariadb-galera::members' :}  
          }
       }

 
}
