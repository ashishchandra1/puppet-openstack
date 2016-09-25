class openstack-keystone::keystone-db-sync{

    notify {"Syncing DB For Keystone":} ->
    exec {"Keystone DB Syncing":
        command => "su -s /bin/sh -c 'keystone-manage db_sync' keystone",
        user => 'root',
    }
}
