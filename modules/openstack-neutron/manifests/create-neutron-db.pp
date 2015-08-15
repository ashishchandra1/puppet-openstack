class openstack-neutron::create-neutron-db inherits openstack-neutron::params {

    notify {"Creating a new neutron database ":} ->
    exec { "create-${NEUTRON_DB_NAME}-db":
        unless => "/usr/bin/mysql -u${NEUTRON_DB_USER} -p${NEUTRON_DB_PASSWORD} ${NEUTRON_DB_NAME}",
        command => "/usr/bin/mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \"create database ${NEUTRON_DB_NAME}; grant all privileges on ${NEUTRON_DB_NAME}.* to '${NEUTRON_DB_USER}'@'localhost' identified by '$NEUTRON_DB_PASSWORD'; grant all privileges on ${NEUTRON_DB_NAME}.* to '${NEUTRON_DB_USER}'@'%' identified by '$NEUTRON_DB_PASSWORD';\"",
    }
}
