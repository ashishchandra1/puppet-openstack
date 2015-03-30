# == Class: openstack-compute
#
# Full description of class compute here.
#
# === Parameters
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class openstack-compute {

  #include openstack-compute::packages 
  #include openstack-compute::params 
  #include openstack-compute::config
 
   #For installing openstack compute Services On Controller Node
   class {'openstack-compute::params' :} ->
   class {'openstack-compute::users' :} ->
   class {'openstack-compute::endpoint' :} ->
   class {'openstack-compute::packages' :} ->
   class {'openstack-compute::config' :} ->
   class {'openstack-compute::services' :}
   #For installing openstack compute Services On Compute Side
   class {'openstack-compute::computes' :}
}
