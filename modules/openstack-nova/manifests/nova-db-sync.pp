class openstack-nova::nova-db-sync {

    notify {"Syncing DB For Nova":} ->
    exec {"Nova_api DB Syncing":
        command => "su -s /bin/sh -c 'nova-manage api_db sync' nova",
        user => 'root',
        require =>  Package["python-novaclient"],
    } ->
    
    exec {"Nova DB Syncing":
        command => "su -s /bin/sh -c 'nova-manage db sync' nova",
        user => 'root',
        require =>  Package["python-novaclient"],
    } 
}
