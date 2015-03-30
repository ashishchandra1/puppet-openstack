# == Class: openstack-compute::users
#
# Author Name <arazaamir@gmail.com>
#
# Copyright 2015 Your name here, unless otherwise noted.
#

# This module installs packages for nova
class openstack-compute::users inherits openstack-compute::params {
 include openstack-compute::params
 #require('openstack-compute::packages')
 require ('openstack-compute::params')
 

 notify {"Creating Script File For Nova Users and Roles":} ->
 file { '/tmp/nova-init-user.sh':
    content => template('openstack-compute/nova-init-user.sh'),
    require  => Class['openstack-compute::params'],
  } ->
  
  notify {"Executing Script File For Nova Users and Roles":} ->
   exec {"Executing script for Nova Users and Roles":
    path => ["/usr/bin/","/usr/sbin/","/bin"],
    command => "bash /tmp/nova-init-user.sh",
    user => 'root',
  } 


  
}
