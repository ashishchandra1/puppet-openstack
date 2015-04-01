# == Class: galera
#      This class is for primary Galera Cluster which initializes the cluster
# == Author
#  Aamir Raza <aamir-araza@gmail.com>
#             <raza.aamir01@gmail.com>


class mariadb-galera::primary {

   notify {"Initialized cluster on primary node":} ->
    exec {"Initialized cluster on primary node":
    path => ["/usr/bin/","/usr/sbin/","/bin"],
    command => "/etc/init.d/mysql start --wsrep-new-cluster",
    user => 'root',
  }
}
