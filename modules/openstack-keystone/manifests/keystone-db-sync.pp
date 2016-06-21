class openstack-keystone::keystone-db-sync{

    notify {"Syncing DB For Keystone":} ->
    exec {"Keystone DB Syncing":
        command => "su -s /bin/sh -c 'keystone-manage db_sync' keystone",
        user => 'root',
    }

    notify {" Keystone":} ->
    exec {"Initialize Fernet Keys":
        command => "keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone",
        user => 'root',
    }

}
