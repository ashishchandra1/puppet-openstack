class openstack-cinder::cinder-db-sync {

     $CINDER_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = $hostname 
     $CINDER_HOST = $ipaddress
     $CINDER_ADMIN_PORT = '8776'
     $ADMIN_TOKEN = '@dmin123'
     $RABBIT_PASS = '@dmin123' 

  notify {"CREATE SHELL SCRIPT TO SYNC CINDER DB ":} ->
  file { '/tmp/cinder-init-db.sh':
    content => template('openstack-cinder/cinder-init-db.sh'),
    mode    => 0755,
  } ->

  notify {"Syncing DB For Cinder":} ->
  exec {"Cinder DB Syncing":
     command => "su -s /bin/sh -c 'cinder-manage db sync' cinder",
     user => 'root',
   require =>  Package["python-cinderclient"],
  } 


}
