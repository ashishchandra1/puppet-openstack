class openstack-glance::keystone {

     $GLANCE_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = "controller" 
     $GLANCE_ADMIN_PORT = '9292'

     $KEYSTONE_HOST = "controller"
     $KEYSTONE_ADMIN_PORT = '35357'
     $ADMIN_TOKEN = '@dmin123'
     
     $admin_tenant = "admin"
     $admin_user =  "admin"
     $admin_user_pass = "@dmin123"
     $region = "regionOne"
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
