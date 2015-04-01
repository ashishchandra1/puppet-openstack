# == Class: galera
#
# "This class install packages of MariaDB Sever with Galera"
# === Authors
#
# Aamir Raza  <aamir-araza@gmail.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class mariadb-galera::packages inherits  mariadb-galera::repo {
 
  include mariadb-galera::repo 
  require('mariadb-galera::repo')

  #List Of packages for galera server and client
  $packages_repo = [
        "rsync",
        "galera",
        "MariaDB-Galera-server",
        "MariaDB-client",
        "expect"
     ]
  #Packages for galera and rysnc
  $packages = [
        "rsync",
        "galera"
     ]
  
  #TODO It causes some packages conflicting issues so uncomment this if it occurs
  #notify {"Remove SQL Libs":}
  #exec {"remove-sqllibs":
  #path => ["/usr/bin/","/usr/sbin/","/bin"],
  #command => "yum remove mysql-libs -y", 
  #user => 'root',
  #} ->
    

  #Enabled Delta RPMS in OS
  notify {"Enable Detals rpms ":}
  exec {"delta rpms":
  path => ["/usr/bin/","/usr/sbin/","/bin"],
  command => "yum provides '*/applydeltarpm' ",
  user => 'root',
  } ->
 
  #Installing epel release
  notify {"Installing epel package":} ->
  package { "epel-release": ensure => "installed" } ->
  notify {"Installing Socat package":} -> 
  package { "socat": ensure => "installed" } ->

  #Installing Packages
  notify {"Installing GaleraMariaDB Server and Client":} ->
  package { $packages_repo: 
  ensure => "installed", 
  require => Yumrepo["mariadb"]}  
  

  #Installing Packages
  #notify {"Installing rsync and Galera":} ->
  #package { $packages: ensure => "installed" }


}
