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
    $demo_user = "demo"
    $demo_user_pass = "@dmin123"

    notify {"Create KEYSTONE Service and Service Endpoint":} ->
    file { "/tmp/keystone-service-endpoint.sh":
        content => template('openstack-keystone/endpoint-init.sh'),
        mode => 0755,
    } ->
  
    notify {"Executing Script for keystone enpoint":} ->
    exec {"Executing Script for keystone endpoint creation":
        path => ["/usr/bin/","/usr/sbin/","/bin"],
        command => 'bash /tmp/keystone-service-endpoint.sh',
        user => 'root',
    } ->

    notify {"Creating Script for Keystone  user/tenant creation":} ->
    file { '/tmp/keystone-create-user.sh':
        content => template('openstack-keystone/keystone-init-user.sh'),
        mode => 0755,
    } -> 
  
    notify {"Executing Script for openstack user creation":} ->
    exec {"Executing Script for openstack user creation":
        command => 'bash /tmp/keystone-create-user.sh',
        user => 'root'
    }
}
