class openstack-cinder::cinder-db-sync {

  notify {"Syncing DB For Cinder":} ->
  exec {"Cinder DB Syncing":
     command => "su -s /bin/sh -c 'cinder-manage db sync' cinder",
     user => 'root'
  } 


}
