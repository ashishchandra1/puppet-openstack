class openstack-keystone::create-keystone-db inherits openstack-keystone::params {

    notify {"Creating a new Keystone DB":} ->
    exec { "create-${KEYSTONE_DB_NAME}-db":
        unless => "/usr/bin/mysql -u${KEYSTONE_DB_USER} -p${KEYSTONE_DB_PASSWORD} ${KEYSTONE_DB_NAME}",
        command => "/usr/bin/mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \"create database ${KEYSTONE_DB_NAME}; grant all privileges on ${KEYSTONE_DB_NAME}.* to '${KEYSTONE_DB_USER}'@'localhost' identified by '$KEYSTONE_DB_PASSWORD'; grant all privileges on ${KEYSTONE_DB_NAME}.* to '${KEYSTONE_DB_USER}'@'%' identified by '$KEYSTONE_DB_PASSWORD';\"",
    }
}
