# == Class: openstack-compute::computes
#
# Author Name <arazaamir@gmail.com>
#
# Copyright 2015 Your name here, unless otherwise noted.
#

# This module installs packages for nova
class openstack-compute::computes inherits openstack-compute::params {
  include openstack-compute::params
  #List Of packages
  $cmp_packages = [ 
        "openstack-nova-compute",
        "sysfsutils", 
     ]
  $cmp_services = [
        "libvirtd",
        "openstack-nova-compute",
        ]

  #Installing Packages
  notify {"Installing Nova Compute Packages On Compute Host":} ->
  package { $cmp_packages: ensure => "installed" } ->
 
  notify {"Installing pakage using yum":} ->
    exec {"Installing sysfsutils package ":
    path => ["/usr/bin/","/usr/sbin/","/bin"],
    command => "yum install sysfsutils",
    user => 'root',
  }-> 
    
  file { '/etc/nova/nova.conf':
    content => template('openstack-compute/nova-conf-computes.erb'),
    group => "nova",
    require  => Class['openstack-compute::params'],
  }->
  
  #Enabling and Starting  Services
  notify {"Enabling and starting  Nova Compute Services on Compute Node":} ->
  service { $cmp_services:
   enable => true,
   ensure => "running" }

}
