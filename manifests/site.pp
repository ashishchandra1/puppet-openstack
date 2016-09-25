Exec {
      path => [ '/usr/local/bin', '/usr/bin',
                '/usr/sbin', '/bin'],
      logoutput => true,
    }

#include openstack-initial-packages
#include haproxy-keepalived
#include rabbitmq-ha
#include mariadb-galera
#include openstack-keystone
#include openstack-glance
#include openstack-cinder
#include openstack-nova
#include openstack-neutron
#include openstack-dashboard
