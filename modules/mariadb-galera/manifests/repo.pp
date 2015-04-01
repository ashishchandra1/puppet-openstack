class mariadb-galera::repo {
  
 #Added yum repo
 yumrepo { 'MariaDb':
    baseurl         => "http://yum.mariadb.org/10.0/centos7-amd64",
    enabled         => '1',
    gpgcheck        => '1',
    gpgkey          => 'https://yum.mariadb.org/RPM-GPG-KEY-MariaDB',
    descr           => 'MariaDB Yum Repository',
  }

}
