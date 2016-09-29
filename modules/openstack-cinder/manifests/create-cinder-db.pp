class openstack-cinder::create-cinder-db inherits openstack-cinder::params {

    notify {"Creating a new cinder database ":} ->
    exec { "create-cinder-db":
        unless => "/usr/bin/mysql -ucinder -p${CINDER_DB_PASSWORD} cinder",
        command => "/usr/bin/mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \"create database cinder; grant all privileges on cinder.* to cinder@localhost identified by '$CINDER_DB_PASSWORD'; grant all privileges on cinder.* to cinder@'%' identified by '$CINDER_DB_PASSWORD';\"",
    }


}
