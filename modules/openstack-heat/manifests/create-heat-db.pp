class openstack-heat::create-heat-db inherits openstack-heat::params {

    notify {"Creating a new Heat database ":} ->
    exec { "create-${HEAT_DB_NAME}-db":
        unless => "/usr/bin/mysql -u${HEAT_DB_USER} -p${HEAT_DB_PASSWORD} ${HEAT_DB_NAME}",
        command => "/usr/bin/mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \"create database ${HEAT_DB_NAME}; grant all privileges on ${HEAT_DB_NAME}.* to '${HEAT_DB_USER}'@'localhost' identified by '$HEAT_DB_PASSWORD'; grant all privileges on ${HEAT_DB_NAME}.* to '${HEAT_DB_USER}'@'%' identified by '$HEAT_DB_PASSWORD';\"",
    }
}
