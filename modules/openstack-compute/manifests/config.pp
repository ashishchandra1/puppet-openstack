# == Class: openstack-compute::config
#
# Author Name <arazaamir@gmail.com>
#
# Copyright 2015 Your name here, unless otherwise noted.
#

# This module installs packages for nova

#include openstack-compute::params
class openstack-compute::config inherits openstack-compute::params {
 include openstack-compute::params 
 require('openstack-compute::packages')
 require ('openstack-compute::params')
 
 file { '/etc/nova/nova.conf':
    content => template('openstack-compute/nova-conf.erb'),
    group => "nova",
    require  => Class['openstack-compute::params'],
  }


 file { '/etc/nova/api-paste.ini':
    content => template('openstack-compute/api-paste-conf.erb'),
    group => "nova",
  }

 file { '/tmp/nova-init.sh':
    content => template('openstack-compute/nova-init.sh'),
    mode    => 0755,
  } ->
 
 notify {"Executing Script For nova database":} ->
   exec {"Executing script for Nova Database":
    path => ["/usr/bin/","/usr/sbin/","/bin"],
    command => "bash /tmp/nova-init.sh",
    user => 'root',
  }

}
