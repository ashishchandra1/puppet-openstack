class openstack-cinder::keystone inherits openstack-cinder::params {

    notify {"Copy file for Keystone Cinder operations":} ->
    file { '/tmp/keystone-cinder-operations.sh':
        content => template('openstack-cinder/keystone-cinder-operations.sh'),
        mode    => 0755,
    } ->  

    notify {"Keystone operations for Cinder":} ->
    exec {"keystone operations for Cinder":
        command => "bash /tmp/keystone-cinder-operations.sh",
        user => 'root',
    } 
}
