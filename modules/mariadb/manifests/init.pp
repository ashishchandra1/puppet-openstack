class mariadb {
     include mariadb::mariadb
     include mariadb::keystone
     include mariadb::glance
     include mariadb::nova_controller
     include mariadb::cinder
}
