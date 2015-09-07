class openstack-heat::params {
    $HEAT_USER_PASSWORD = '@dmin123'
    $CONTROLLER_HNAME = "controller"
    $VERBOSE = 'True'

    $MYSQL_ROOT_PASSWORD = '459nvDB91fWU'
    $HEAT_DB_PASSWORD = 'F3K5E4N4992b'
    $HEAT_DB_USER = 'heat'
    $HEAT_DB_NAME = 'heat'

    $KEYSTONE_HOST = "controller"
    $KEYSTONE_ADMIN_PORT = '35357'
    $ADMIN_TOKEN = '@dmin123'

    $admin_tenant = "admin"
    $admin_user =  "admin"
    $admin_user_pass = "@dmin123"
    $region = "regionOne"

    $packages = [
        "openstack-heat-api",
        "openstack-heat-api-cfn",
        "openstack-heat-engine",
        "python-heatclient"
    ]
}
