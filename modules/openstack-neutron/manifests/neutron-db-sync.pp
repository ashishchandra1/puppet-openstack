class openstack-neutron::neutron-db-sync inherits openstack-neutron::params {

    notify {"Syncing DB For Neutron":} ->
    exec {"Neutron DB Syncing":
        command => "su -s /bin/sh -c 'neutron-db-manage --config-file /etc/neutron/neutron.conf --config-file /etc/neutron/plugins/ml2/ml2_conf.ini upgrade head' neutron",
        user => 'root',
    } 
}
