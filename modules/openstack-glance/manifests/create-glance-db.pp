class openstack-glance::create-glance-db inherits openstack-glance::params {

    notify {"Creating a new Glance database ":} ->
    exec { "create-$glance-db":
        unless => "/usr/bin/mysql -uglance -p${GLANCE_DB_PASSWORD} $glance",
        command => "/usr/bin/mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \"create database $glance;   grant all privileges on $glance.* to 'glance'@'localhost' identified by '$GLANCE_DB_PASSWORD'; grant all privileges on $glance.* to 'glance'@'%' identified by '$GLANCE_DB_PASSWORD';\"",
    }
}
