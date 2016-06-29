class openstack-neutron::create-neutron-db inherits openstack-neutron::params {

    notify {"Creating a new neutron database ":} ->
    exec { "create-neutron-db":
        unless => "/usr/bin/mysql -uneutron -p${NEUTRON_DB_PASSWORD} neutron",
        command => "/usr/bin/mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \"create database neutron; grant all privileges on neutron.* to 'neutron'@'localhost' identified by '$NEUTRON_DB_PASSWORD'; grant all privileges on neutron.* to 'neutron'@'%' identified by '$NEUTRON_DB_PASSWORD';\"",
    }
}
