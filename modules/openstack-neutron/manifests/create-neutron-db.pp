class openstack-neutron::create-neutron-db inherits openstack-neutron::params {

    notify {"Creating a new neutron database ":} ->
    exec { "create-${db_name}-db":
        unless => "/usr/bin/mysql -u${db_user} -p${db_password} ${db_name}",
        command => "/usr/bin/mysql -uroot -p$mysql_root_password -e \"create database ${db_name}; grant all privileges on ${db_name}.* to '${db_user}'@'localhost' identified by '$db_password'; grant all privileges on ${db_name}.* to '${db_user}'@'%' identified by '$db_password';\"",
    }
}
