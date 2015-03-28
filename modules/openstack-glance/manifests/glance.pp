class openstack-glance::glance {

     $GLANCE_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = $hostname 
     $GLANCE_HOST = $ipaddress
     $GLANCE_ADMIN_PORT = '9292'
     $ADMIN_TOKEN = '@dmin123'
     
     notify {"Installing Openstack glance":} ->
     package {'openstack-glance':
          ensure =>installed,
    } ->

    notify {"Installing Glance client":} ->
    package { 'python-glanceclient':
          ensure => installed,
   } ->

   notify {"CREATING glance-api.conf FILE":} ->
   file { "/etc/glance/glance-api.conf":
       ensure  => file,
       owner  => root,
       group  => glance,
       content => template('openstack-glance/glance-api.erb'),
   } ->

   notify {"CREATING glance-registry.conf FILE":} ->
   file { "/etc/glance/glance-registry.conf":
       ensure  => file,
       owner  => root,
       group  => glance,
       content => template('openstack-glance/glance-registry.erb'),
   } ->

  notify {"CREATE SHELL SCRIPT TO SYNC GLANCE DB ":} ->
  file { '/tmp/glance-init-db.sh':
    content => template('openstack-glance/glance-init-db.sh'),
    mode    => 0755,
  } ->

  # notify {" SYNC GLANCE DB ":} ->
  # exec {"Executing script to sync Glance  DB":
  #  path => ["/usr/bin/","/usr/sbin/","/bin"],
  #  command => "bash /tmp/glance-init-db.sh",
  #  user => 'root',
  #} ->
 
  notify {"DB synced For Glance":} ->
  exec {"DB synced For glance":
    path => ["/usr/bin/","/usr/sbin/","/bin"],
    command => "su -s /bin/sh -c 'glance-manage db_sync' glance",
    user => 'root',
    require =>  Package["python-glanceclient"],
  } ->

 notify {"Enabled Openstack Glance Service":} ->
  exec {"Enabled Openstack Glance Services":
    command => 'systemctl enable openstack-glance.service',
    user => 'root',
    require =>  Package["python-glanceclient"],
  } ->

  notify {"Restart Openstack Glance Services":} ->
  exec {"Restart Openstack Glance Services":
    command => 'systemctl restart openstack-glance.service',
    user => 'root',
    require =>  Package["python-glanceclient"],
  }

}
