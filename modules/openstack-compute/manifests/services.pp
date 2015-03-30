# == Class: openstack-compute::services
#
# Author Name <arazaamir@gmail.com>
#
# Copyright 2015 Your name here, unless otherwise noted.
#

# This module installs packages for nova
class openstack-compute::services {

  #List Of Services
  $services = [ 
        "openstack-nova-api", 
        "openstack-nova-cert", 
        "openstack-nova-consoleauth", 
        "openstack-nova-scheduler", 
        "openstack-nova-conductor", 
        "openstack-nova-novncproxy", 
     ]

  #Enabling and Starting  Services
  notify {"Enabling and starting  Nova Compute Services":} ->
  service { $services:
   enable => true, 
   ensure => "running" }

  
}
