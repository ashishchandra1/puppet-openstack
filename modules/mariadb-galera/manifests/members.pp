# == Class: galera
# This class is only for member nodes of Galera Cluster except Primary Node
# === Authors
#
# Aamir Raza <aamir-araza@gmail.com>
#            <raza.aamir01@gmail.com>
# === Copyright
#
#
class mariadb-galera::members {

  #It runs mysql service on member of clustered nodes  except primary node
  notify {"Starting mariadb Service on member Nodes": } ->
  service { "mysql ":
  ensure => "running",
  }

}
