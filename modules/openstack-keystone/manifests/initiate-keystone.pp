class openstack-keystone::initiate-keystone {

     $KEYSTONE_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = "controller" 

     $KEYSTONE_HOST = "controller"
     $KEYSTONE_ADMIN_PORT = '35357'
     $KEYSTONE_PUBLIC_PORT = '5000'
     $ADMIN_TOKEN = '@dmin123'
     $REGION = "regionOne"
     
     $admin_tenant = "admin"
     $admin_user = "admin"
     $admin_user_pass = "@dmin123"
   
     notify {"Copy file for Keystone operations":} ->
     file { '/tmp/keystone-operations.sh':
            content => template('openstack-keystone/keystone-operations.sh'),
            mode    => 0755,
          } ->  

      notify {"Creating Initial Keystone user, tenanstand services":} ->
      exec {"keystone operations":
            command => "bash /tmp/keystone-operations.sh",
            user => 'root',
      } 
}
