#class openstack-glance {
#    include openstack-glance::keystone
#    include openstack-glance::glance
#}

class openstack-glance {
   class {'keystone':} -> 
   class {'glance':}
}
