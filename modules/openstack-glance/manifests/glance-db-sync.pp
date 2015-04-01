class openstack-glance::glance-db-sync{

  notify {"CREATE SHELL SCRIPT TO SYNC GLANCE DB ":} ->
  file { '/tmp/glance-init-db.sh':
    content => template('openstack-glance/glance-init-db.sh'),
    mode    => 0755,
  } ->

    notify {"DB synced For Glance":} ->
    exec {"DB synced For glance":
    path => ["/usr/bin/","/usr/sbin/","/bin"],
    command => "bash /tmp/glance-init-db.sh",
    user => 'root',
  }

}
