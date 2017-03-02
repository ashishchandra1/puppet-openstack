class openstack-nova::create-nova-db inherits openstack-nova::params {

     notify {"Creating a new nova Database":} ->
     exec { "create-nova-db":
           unless => "/usr/bin/mysql -unova -p${NOVA_DB_PASSWORD} nova",
           command => "/usr/bin/mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \"CREATE DATABASE nova; GRANT ALL PRIVILEGES ON nova.* to nova@localhost IDENTIFIED BY '$NOVA_DB_PASSWORD'; GRANT ALL PRIVILEGES ON nova.* to nova@'%' IDENTIFIED BY '$NOVA_DB_PASSWORD';\"",
      }

     notify {"Creating a new ova_api Database":} ->
     exec { "create-nova_api-db":
           unless => "/usr/bin/mysql -unova -p${NOVA_DB_PASSWORD} nova_api",
           command => "/usr/bin/mysql -uroot -p$MYSQL_ROOT_PASSWORD -e \"CREATE DATABASE nova_api; GRANT ALL PRIVILEGES ON nova_api.* to nova@localhost IDENTIFIED BY '$NOVA_DB_PASSWORD'; GRANT ALL PRIVILEGES ON nova_api.* to nova@'%' IDENTIFIED BY '$NOVA_DB_PASSWORD';\"",
      }
}
