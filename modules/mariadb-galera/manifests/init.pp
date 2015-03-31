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

   class  {'mariadb-galera::setting' :} ->
   class  {'mariadb-galera::params' :} ->
   class {'mariadb-galera::packages' :} ->
   class {'mariadb-galera::config' :} ->
   class {'mariadb-galera::primary' :}

 #For installing MariaDB Galera Cluster on  member nodes
 #  class  {'mariadb-galera::setting' :} ->
 #  class  {'mariadb-galera::params' :} ->
 #  class {'mariadb-galera::packages' :} ->
 #  class {'mariadb-galera::config' :} ->
 #  class {'mariadb-galera::services' :}  

}
