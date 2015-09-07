class openstack-heat::keystone inherits openstack-heat::params {

    notify {"Copy file for Keystone operations":} ->
    file { '/tmp/keystone-heat-operations.sh':
        content => template('openstack-heat/keystone-heat-operations.sh'),
        mode    => 0755,
    } ->

    notify {"Keystone operations for Heat":} ->
    exec {"keystone operations":
        command => "bash /tmp/keystone-heat-operations.sh",
        user => 'root',
    }
}
