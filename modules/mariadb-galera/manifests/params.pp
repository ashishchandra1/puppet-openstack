# == Class: mariadb-galera::params
#  This class takes different parmaters for setting the whole mariaDB Galera Cluster.
# === Variables
# [*HOST_IP*]               : "HOST IP FOR THE SERVER"
# [*HOSTNAME*]              : "HOST NAME OF THE SERVER"
# [*DBPASS*]                : "DATABASE PASSWORD OF THE SERVER"
# [*CLUSTER_MEMBERS_LIST*]  : "LIST OF IPS INCLUDING IN THE WHOLE CLUSTER"
# === Authors
#
# Author Name <aamir-araza@gmail.com>
#
# === Copyright
#
# Copyright 2015 aamir-raza
#
class mariadb-galera::params {
  $HOST_IP                = $ipaddress 
  $HOSTNAME               = $hostname
  $DBPASS                 = "@dmin123"
  $CLUSTER_MEMBERS_LIST   = "192.168.0.59,192.168.0.58,192.168.0.57" 
 
}
