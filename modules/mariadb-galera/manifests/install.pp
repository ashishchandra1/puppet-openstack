class mariadb-galera::install {
yumrepo { 'mariadb':
    baseurl         => "http://yum.mariadb.org/10.0/centos7-amd64",
    enabled         => '1',
    gpgcheck        => '1',
    gpgkey          => 'https://yum.mariadb.org/RPM-GPG-KEY-MariaDB',
    descr           => 'MariaDB Yum Repository',
  }
exec {"socat":
  path => ["/usr/bin/","/usr/sbin/","/bin"],
  command => "yum install socat -y ",
  user => 'root',
}

exec {"mariaDB-packages":
  path => ["/usr/bin/","/usr/sbin/","/bin"],
  command => "yum install MariaDB-Galera-server MariaDB-client rsync galera expect -y ",
  user => 'root',
  require => [Yumrepo["mariadb"]],
}
}
