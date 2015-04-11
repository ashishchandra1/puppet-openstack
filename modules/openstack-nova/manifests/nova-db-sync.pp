class openstack-nova::nova-db-sync {

     $NOVA_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = "controller"
     $NOVA_HOST = $ipaddress
     $NOVA_ADMIN_PORT = '8774'
     $ADMIN_TOKEN = '@dmin123'
     $RABBIT_PASS = '@dmin123' 

  notify {"CREATE SHELL SCRIPT TO SYNC NOVA DB ":} ->
  file { '/tmp/nova-init-db.sh':
    content => template('openstack-nova/nova-controller/nova-init-db.sh'),
    mode    => 0755,
  } ->

  notify {"Syncing DB For Cinder":} ->
  exec {"Cinder DB Syncing":
     command => "su -s /bin/sh -c 'nova-manage db sync' nova",
     user => 'root',
   require =>  Package["python-novaclient"],
  } 


}
