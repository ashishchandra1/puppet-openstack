class openstack-cinder::keystone {

     $CINDER_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = "controller" 

     $KEYSTONE_HOST = "controller"
     $KEYSTONE_ADMIN_PORT = '35357'
     $ADMIN_TOKEN = '@dmin123'
     
     $admin_tenant = "admin"
     $admin_user =  "admin"
     $admin_user_pass = "@dmin123"
     $region = "regionOne"
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
