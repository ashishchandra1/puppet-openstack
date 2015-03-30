# == Class: openstack-compute::endpoint
#
# Author Name <arazaamir@gmail.com>
#
# Copyright 2015 Your name here, unless otherwise noted.
#

# This module installs packages for nova
class openstack-compute::endpoint inherits openstack-compute::params {
 include openstack-compute::params
 #require('openstack-compute::packages')
 require ('openstack-compute::params')
 
 notify {"Creating Script File For Nova endpoints":} ->
 file { '/tmp/nova-endpoint-init.sh':
    content => template('openstack-compute/endpoint-init.sh'),
    require  => Class['openstack-compute::params'],
 } ->

 notify {"Executing Script File For Nova endpoints":} ->
 exec {"Executing script for Nova Endpoints":
    path => ["/usr/bin/","/usr/sbin/","/bin"],
    command => "bash /tmp/nova-endpoint-init.sh",
    user => 'root',
  }
  
}
