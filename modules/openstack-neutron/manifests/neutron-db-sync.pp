class openstack-neutron::neutron-db-sync {

     $NEUTRON_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = "controller"
     $NEUTRON_HOST = $ipaddress
     $NEUTRON_ADMIN_PORT = '9696'
     $ADMIN_TOKEN = '@dmin123'
     $RABBIT_PASS = '@dmin123' 

#  notify {"CREATE SHELL SCRIPT TO SYNC NEUTRON DB ":} ->
#  file { '/tmp/neutron-init-db.sh':
#    content => template('openstack-neutron/neutron-controller/neutron-init-db.sh'),
#    mode    => 0755,
#  } ->

  notify {"Syncing DB For Neutron":} ->
  exec {"Nova DB Syncing":
     command => "su -s /bin/sh -c "neutron-db-manage --config-file /etc/neutron/neutron.conf --config-file /etc/neutron/plugins/ml2/ml2_conf.ini upgrade juno" neutron",
     user => 'root',
   require =>  Package["python-neutronclient"],
  } 


}
