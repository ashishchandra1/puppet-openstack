class openstack-cinder::create-cinder-db inherits openstack-cinder::params {

    notify {"Creating a new cinder database ":} ->
    exec { "create-${CINDER_DB_NAME}-db":
        unless => "/usr/bin/mysql -u${CINDER_DB_USER} -p${CINDER_DB_PASSWORD} ${CINDER_DB_NAME}",
        command => "/usr/bin/mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \"create database ${CINDER_DB_NAME}; grant all privileges on ${CINDER_DB_NAME}.* to ${CINDER_DB_USER}@localhost identified by '$CINDER_DB_PASSWORD'; grant all privileges on ${CINDER_DB_NAME}.* to ${CINDER_DB_USER}@'%' identified by '$CINDER_DB_PASSWORD';\"",
    }


}
