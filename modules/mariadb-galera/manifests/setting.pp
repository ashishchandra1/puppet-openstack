# == Class: galera
#  This class Disbaled SELINUX for mariaDBGalera Cluster
#  NOTE:It’s currently not possible to have SELinux in enforcing mode because there are no policies (yet) for MariaDB Galera Cluster 10.0
# === Authors
#
# Author Name <aamir-araza@gmail.com>
#
# === Copyright
#
# Copyright 2015 aamir-raza
#
class mariadb-galera::setting {


 #SELINUX PERMISSIVE  MODE
 notify {"SELINUX PERMISSIVE MODE": } ->
 exec {"selinux permissive":
  path => ["/usr/bin/","/usr/sbin/","/bin"],
  command => "setenforce 0",
  user => 'root',
  }
 
}
