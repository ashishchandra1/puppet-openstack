# == Class: openstack-compute::packages
#
# Author Name <arazaamir@gmail.com>
#
# Copyright 2015 Your name here, unless otherwise noted.
#

# This module installs packages for nova
class openstack-compute::packages {

  #List Of packages
  $packages = [ 
        "openstack-nova-api", 
        "openstack-nova-cert", 
        "openstack-nova-conductor", 
        "openstack-nova-console", 
        "openstack-nova-novncproxy", 
        "openstack-nova-scheduler", 
        "python-novaclient" 
     ]

  #Installing Packages
  notify {"Installing Nova Compute Packages":} ->
  package { $packages: ensure => "installed" }

  
}
