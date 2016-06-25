class openstack-nova::keystone_operations inherits openstack-nova::params {

     notify {"Copy file for Keystone Nova operations":} ->
     file { '/tmp/keystone-nova-operations.sh':
            content => template('openstack-nova/nova-controller/keystone-nova-operations.sh'),
            mode    => 0755,
          } ->  

      notify {"Keystone operations for Nova":} ->
      exec {"keystone operations for Nova":
            command => "bash /tmp/keystone-nova-operations.sh",
            user => 'root',
      } 
}
