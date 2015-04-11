class openstack-neutron::keystone {

     $KEYSTONE_HOST = "controller"
     $KEYSTONE_ADMIN_PORT = '35357'
     $ADMIN_TOKEN = '@dmin123'
     
     $admin_tenant = "admin"
     $admin_user =  "admin"
     $admin_user_pass = "@dmin123"
     $region = "regionOne"
     notify {"Copy file for Keystone neutron operations":} ->
     file { '/tmp/keystone-neutron-operations.sh':
            content => template('openstack-neutron/neutron-controller/keystone-neutron-operations.sh'),
            mode    => 0755,
          } ->  

      notify {"Keystone operations for Neutron":} ->
      exec {"keystone operations for Neutron":
            command => "bash /tmp/keystone-neutron-operations.sh",
            user => 'root',
      } 
}
