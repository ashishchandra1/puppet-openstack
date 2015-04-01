class openstack-glance {
   class {'keystone':} -> 
   class {'glance-installation':} ->
   class {'glance-db-sync.pp'} ->
   class {'glance-operations:'}

}
