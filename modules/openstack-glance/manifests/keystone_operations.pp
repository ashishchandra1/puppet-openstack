class openstack-glance::keystone_operations inherits openstack-glance::params {

    notify {"Copy file for Keystone operations":} ->
    file { '/tmp/keystone-glance-operations.sh':
        content => template('openstack-glance/keystone-glance-operations.sh'),
        mode    => 0755,
    } ->  

    notify {"Keystone operations for Glance":} ->
    exec {"keystone operations":
        command => "bash /tmp/keystone-glance-operations.sh",
        user => 'root',
    } 
}
