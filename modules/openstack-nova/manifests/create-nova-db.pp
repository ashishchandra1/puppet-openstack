class openstack-nova::create-nova-db inherits openstack-nova::params {

     notify {"Creating a new nova database ":} ->
     exec { "create-nova-db":
           unless => "/usr/bin/mysql -unova -p${NOVA_DB_PASSWORD} nova",
           command => "/usr/bin/mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \"create database nova; grant all privileges on nova.* to nova@localhost identified by '$NOVA_DB_PASSWORD'; grant all privileges on nova.* to nova@'%' identified by '$NOVA_DB_PASSWORD';\"",
      }

     notify {"Creating a new nova_api database ":} ->
     exec { "create-nova_api-db":
           unless => "/usr/bin/mysql -unova -p${NOVA_DB_PASSWORD} nova_api",
           command => "/usr/bin/mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \"create database nova_api; grant all privileges on nova_api.* to nova@localhost identified by '$NOVA_DB_PASSWORD'; grant all privileges on nova_api.* to nova@'%' identified by '$NOVA_DB_PASSWORD';\"",
      }
}
