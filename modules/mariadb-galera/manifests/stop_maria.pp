# == Class: galera
# This class is only for member nodes of Galera Cluster except Primary Node
# === Authors
#
# Aamir Raza <aamir-araza@gmail.com>
#            <raza.aamir01@gmail.com>
# === Copyright
#
#
class mariadb-galera::stop_maria {

  #It runs mysql service on member of clustered nodes  except primary node
  notify {"Stoping mariadb Service on member Nodes": } ->
  #service { "mysql ":
  #ensure => "stopped",
  exec{"/etc/init.d/mysql stop":}
  

}
