class openstack-glance::create-glance-db inherits openstack-glance::params {

    notify {"Creating a new Glance database ":} ->
    exec { "create-${GLANCE_DB_NAME}-db":
        unless => "/usr/bin/mysql -u${GLANE_DB_USER} -p${GLANCE_DB_PASSWORD} ${GLANCE_DB_NAME}",
        command => "/usr/bin/mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \"create database ${GLANCE_DB_NAME};   grant all privileges on ${GLANCE_DB_NAME}.* to '${GLANE_DB_USER}'@'localhost' identified by '$GLANCE_DB_PASSWORD'; grant all privileges on ${GLANCE_DB_NAME}.* to '${GLANE_DB_USER}'@'%' identified by '$GLANCE_DB_PASSWORD';\"",
    }
}
