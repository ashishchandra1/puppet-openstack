Exec {
      path => [
              '/usr/local/bin', '/usr/bin',
              '/usr/sbin', '/bin'],
              logoutput => true,
     }

class openstack-install {
   class {'ntp':} -> class{'openstack-packages':} -> class{'mariadb':} -> class{'rabbitmq':} -> class{'openstack-keystone':} -> class{'openstack-glance':} -> class{'openstack-compute':}

}

include openstack-install
