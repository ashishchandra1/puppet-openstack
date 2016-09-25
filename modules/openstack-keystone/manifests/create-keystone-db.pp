class openstack-keystone::create-keystone-db inherits openstack-keystone::params {

    notify {"Creating a new keystone database ":} ->
    exec { "create-keystone-db":
        unless => "/usr/bin/mysql -ukeystone -p${KEYSTONE_DB_PASSWORD} keystone",
        command => "/usr/bin/mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \"create database keystone; grant all privileges on keystone.* to 'keystone'@'localhost' identified by '$KEYSTONE_DB_PASSWORD'; grant all privileges on keystone.* to 'keystone'@'%' identified by '$KEYSTONE_DB_PASSWORD';\"",
    }
}
