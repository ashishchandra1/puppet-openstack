class openstack-cinder {
   class {'keystone':} -> 
   class {'cinder':}
}
