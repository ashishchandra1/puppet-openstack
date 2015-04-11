class openstack-nova::keystone {

     $NOVA_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = "controller" 
     $CINDER_HOST = $ipaddress
     $CINDER_ADMIN_PORT = '8774'

     $KEYSTONE_HOST = "controller"
     $KEYSTONE_ADMIN_PORT = '35357'
     $ADMIN_TOKEN = '@dmin123'
     
     $admin_tenant = "admin"
     $admin_user =  "admin"
     $admin_user_pass = "@dmin123"
     $region = "regionOne"
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
