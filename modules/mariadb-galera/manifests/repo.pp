# == Class: mariadb-galera::repo
#        This class added mariadb repo for Galera Client and Server
# == Aamir raza  <aamir-araza@gmail.com>
#                <raza.aamir01@gmail.com>           
#
class mariadb-galera::repo {
  
 #Added yum repo
 yumrepo { 'mariadb':
    baseurl         => "http://yum.mariadb.org/10.0/centos6-amd64",
    enabled         => '1',
    gpgcheck        => '1',
    gpgkey          => 'https://yum.mariadb.org/RPM-GPG-KEY-MariaDB',
    descr           => 'MariaDB Yum Repository',
  }

}
