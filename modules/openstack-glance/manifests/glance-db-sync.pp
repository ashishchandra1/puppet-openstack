class openstack-glance::glance-db-sync{

    notify {"Syncing DB For Glance":} ->
    exec {"Glance DB Syncing":
        command => "su -s /bin/sh -c 'glance-manage db_sync' glance",
        user => 'root',
     }

}
