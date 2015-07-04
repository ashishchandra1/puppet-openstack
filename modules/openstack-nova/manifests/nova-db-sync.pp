class openstack-nova::nova-db-sync {

    notify {"Syncing DB For Nova":} ->
    exec {"Nova DB Syncing":
        command => "su -s /bin/sh -c 'nova-manage db sync' nova",
        user => 'root',
        require =>  Package["python-novaclient"],
    } 
}
