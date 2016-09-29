class openstack-keystone::params {

    $CONTROLLER_HNAME = "controller" 
    $KEYSTONE_HOST = "controller"
    $KEYSTONE_ADMIN_PORT = '35357'
    $ADMIN_TOKEN = '@dmin123'
    $region = "regionOne"
    $VERBOSE = 'True' 

    $MYSQL_ROOT_PASSWORD = '459nvDB91fWU'
    $KEYSTONE_DB_PASSWORD = '29Q51nX6XeCq'
     
    $admin_user_pass = "@dmin123"
    $demo_user_pass = "@dmin123"

    $packages = [
        "openstack-keystone",
        "httpd",
        "mod_wsgi"
    ]
}
