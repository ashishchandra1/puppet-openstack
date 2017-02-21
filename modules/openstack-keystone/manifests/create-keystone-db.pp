class openstack-keystone::create-keystone-db inherits openstack-keystone::params {

    notify {"Creating a new keystone database ":} ->
    exec { "create-keystone-db":
        unless => "/usr/bin/mysql -ukeystone -p${KEYSTONE_DB_PASSWORD} keystone",
        command => "/usr/bin/mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \" CREATE DATABASE keystone; GRANT ALL PRIVILEGES ON keystone.* to 'keystone'@'localhost' IDENTIFIED BY '$KEYSTONE_DB_PASSWORD'; GRANT ALL PRIVILEGES ON keystone.* to 'keystone'@'%' IDENTIFIED BY '$KEYSTONE_DB_PASSWORD';\"",
          }
}
