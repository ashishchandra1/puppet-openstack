class openstack-cinder::create-cinder-db inherits openstack-cinder::params {

    notify {"Creating a new cinder database ":} ->
    exec { "create-cinder-db":
        unless => "/usr/bin/mysql -ucinder -p${CINDER_DB_PASSWORD} cinder",
        command => "/usr/bin/mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \"CREATE DATABASE cinder; GRANT ALL PRIVILEGES ON cinder.* to cinder@localhost IDENTIFIED BY '$CINDER_DB_PASSWORD'; GRANT ALL PRIVILEGES ON cinder.* to cinder@'%' IDENTIFIED BY '$CINDER_DB_PASSWORD';\"",
    }


}
