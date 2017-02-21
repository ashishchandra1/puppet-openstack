class openstack-glance::create-glance-db inherits openstack-glance::params {

    notify {"Creating a new Glance database":} ->
    exec { "create-glance-db":
        unless => "/usr/bin/mysql -uglance -p${GLANCE_DB_PASSWORD} glance",
        command => "/usr/bin/mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \"CREATE DATABASE glance; GRANT ALL PRIVILEGES ON  glance.* to 'glance'@'localhost' IDENTIFIED BY '$GLANCE_DB_PASSWORD'; GRANT ALL PRIVILEGES ON glance.* to 'glance'@'%' IDENTIFIED BY '$GLANCE_DB_PASSWORD';\"",
    }
}
