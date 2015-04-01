class mariadb-galera::config inherits mariadb-galera::params {
 #Include params class
 include mariadb-galera::params
 require('mariadb-galera::params')

  #Inject conf file of cluster
  notify {"Injecting Cluster configuration file ":} ->
  file { '/etc/my.cnf.d/server.cnf':
    content => template('mariadb-galera/mariadb-primary.erb'),
    require  => Class['mariadb-galera::params'],
  }
 
}
