include ntp 

Exec {
      path => [
              '/usr/local/bin', '/usr/bin',
              '/usr/sbin', '/bin'],
              logoutput => true,
     }

include openstack_packages
include mariadb

