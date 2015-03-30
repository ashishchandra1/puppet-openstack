class openstack-cinder::cinder {

     $CINDER_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = $hostname 
     $CINDER_HOST = $ipaddress
     $CINDER_ADMIN_PORT = '8776'
     $ADMIN_TOKEN = '@dmin123'
     $RABBIT_PASS = '@dmin123' 
     notify {"Installing Openstack cinder":} ->
     package {'openstack-cinder':
          ensure =>installed,
    } ->

    notify {"Installing Cinder client":} ->
    package { 'python-cinderclient':
          ensure => installed,
   } ->


    notify {"Installing Python oslo db":} ->
    package { 'python-oslo-db':
          ensure => installed,
   } ->

   notify {"CREATING cinder.conf FILE":} ->
   file { "/etc/cinder/cinder.conf":
       ensure  => file,
       owner  => root,
       group  => cinder,
       content => template('openstack-cinder/cinder.conf.erb'),
   } ->

  notify {"CREATE SHELL SCRIPT TO SYNC CINDER DB ":} ->
  file { '/tmp/cinder-init-db.sh':
    content => template('openstack-cinder/cinder-init-db.sh'),
    mode    => 0755,
  } ->

  notify {"Syncing DB For Cinder":} ->
  exec {"Cinder DB Syncing":
    path => ["/usr/bin/","/usr/sbin/","/bin"],
    command => "su -s /bin/sh -c 'cinder-manage db sync' cinder",
    user => 'root',
    require =>  Package["python-cinderclient"],
  } ->

 notify {"Enable Cinder Service":} ->
  exec {"Enabled Cinder Services":
    command => 'systemctl enable openstack-cinder-api.service openstack-cinder-scheduler.service',
    user => 'root',
    require =>  Package["python-cinderclient"],
  } ->

  notify {"Restart Cinder Services":} ->
  exec {"Restart Cinder Services":
    command => 'systemctl restart openstack-cinder-api.service openstack-cinder-scheduler.service',
    user => 'root',
    require =>  Package["python-cinderclient"],
  }

}
