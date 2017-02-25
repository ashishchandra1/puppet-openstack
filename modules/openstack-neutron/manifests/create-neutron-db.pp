class openstack-neutron::create-neutron-db inherits openstack-neutron::params {

    notify {"Creating a new neutron database ":} ->
    exec { "create-neutron-db":
        unless => "/usr/bin/mysql -uneutron -p${NEUTRON_DB_PASSWORD} neutron",
        command => "/usr/bin/mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \"CREATE DATABASE neutron; GRANT ALL PRIVILEGES ON neutron.* to 'neutron'@'localhost' IDENTIFIED BY '$NEUTRON_DB_PASSWORD'; GRANT ALL PRIVILEGES ON neutron.* to 'neutron'@'%' IDENTIFIED BY '$NEUTRON_DB_PASSWORD';\"",
    }
}
