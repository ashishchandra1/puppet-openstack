class openstack-initial-packages {
   
  class{"openstack-packages":} -> class{"ntp-memcached-operations":} 
}
