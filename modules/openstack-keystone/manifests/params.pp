class openstack-keystone::params {
	$mysql_root_password = '@dmin123'
    $db_user = 'keystone'
    $db_name = 'keystone'
    $db_password = '@dmin123'

    $KEYSTONE_DBPASS = '@dmin123'
    $CONTROLLER_HNAME = "controller" 
    $KEYSTONE_HOST = "controller"
    $KEYSTONE_ADMIN_PORT = '35357'
    $ADMIN_TOKEN = '@dmin123'
    $REGION = "regionOne"
    $MEMCACHED_SERVERS = "controller1:11211,controller2:11211,controller3:11211"
    $VERBOSE = 'True' 
     
    $admin_tenant = "admin"
    $demo_tenant  = "demo"
    $service_tenant = "service"
    $admin_user = "admin"
    $admin_user_pass = "@dmin123"
    $demo_user = "demo"
    $demo_user_pass = "@dmin123"

    $packages = [
        "openstack-keystone",
        "python-openstackclient",
        "httpd",
        "mod_wsgi",
        "memcached",
        "python-memcached"
    ]
}