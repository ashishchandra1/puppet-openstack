class openstack-neutron::keystone inherits openstack-neutron::params {

    notify {"Copy file for Keystone neutron operations":} ->
    file { '/tmp/keystone-neutron-operations.sh':
        content => template('openstack-neutron/neutron-controller/keystone-neutron-operation.sh'),
        mode    => 0755,
    } ->  

    notify {"Keystone operations for Neutron":} ->
    exec {"keystone operations for Neutron":
        command => "bash /tmp/keystone-neutron-operations.sh",
        user => 'root',
    } 
}
