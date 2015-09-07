class openstack-heat::heat-db-sync{

    notify {"Syncing DB For Heat":} ->
    exec {"Heat DB Syncing":
        command => "su -s /bin/sh -c 'heat-manage db_sync' heat",
        user => 'root',
     }
}
