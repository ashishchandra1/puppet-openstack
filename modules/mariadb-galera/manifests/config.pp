# == Class: mariadb-galera::config
#
#   "This class Stopped the mariaDB service and injected the customized configuration file"
# === Authors
#
# Author Name <aamir-araza@gmail.com>
#
# === Copyright
#
# Copyright 2015 aamir-raza
#
class mariadb-galera::config inherits mariadb-galera::params {
 #Include params class
 include mariadb-galera::params
 require('mariadb-galera::params')
 #Ensure service is stopped
 notify {"Ensure service must be stopped ":} -> 
 service { "cron":
  ensure => "stopped",
  } ->
  #Inject conf file of cluster
  notify {"Injecting Cluster configuration file ":} ->
  file { '/etc/my.cnf.d/server.cnf':
    content => template('mariadb-galera/mariadb-primary.erb'),
    require  => Class['mariadb-galera::params'],
  }
 
}
