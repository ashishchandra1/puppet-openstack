class openstack-glance::params {
    $GLANCE_DBPASS = '@dmin123'
    $CONTROLLER_HNAME = "controller" 
    $VERBOSE = 'True' 
    
    $mysql_root_password = '@dmin123'
    $db_user = 'glance'
    $db_name = 'glance'
    $db_password = '@dmin123'

    $KEYSTONE_HOST = "controller"
    $KEYSTONE_ADMIN_PORT = '35357'
    $ADMIN_TOKEN = '@dmin123'
     
    $admin_tenant = "admin"
    $admin_user =  "admin"
    $admin_user_pass = "@dmin123"
    $region = "regionOne"

    $packages = [
        "openstack-glance",
        "python-glance",
        "python-glanceclient"
    ]
}