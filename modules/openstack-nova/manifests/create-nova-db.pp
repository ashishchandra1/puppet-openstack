class openstack-nova::create-nova-db inherits openstack-nova::params {

     notify {"Creating a new nova database ":} ->
     exec { "create-${NOVA_DB_NAME}-db":
           unless => "/usr/bin/mysql -u${NOVA_DB_USER} -p${NOVA_DB_PASSWORD} ${NOVA_DB_NAME}",
           command => "/usr/bin/mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \"create database ${NOVA_DB_NAME}; grant all privileges on ${NOVA_DB_NAME}.* to ${NOVA_DB_USER}@localhost identified by '$NOVA_DB_PASSWORD'; grant all privileges on ${NOVA_DB_NAME}.* to ${NOVA_DB_USER}@'%' identified by '$NOVA_DB_PASSWORD';\"",
      }


}
