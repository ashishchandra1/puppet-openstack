class openstack-keystone::initiate-keystone inherits openstack-keystone::params {

   notify {"Bootstraping Identity Service":} ->
    exec {"Bootstrap Keytone":
        command => "keystone-manage bootstrap --bootstrap-password $ADMIN_TOKEN --bootstrap-admin-url http://$CONTROLLER_HNAME:$KEYSTONE_ADMIN_PORT/v3/  --bootstrap-internal-url http://$CONTROLLER_HNAME:$KEYSTONE_ADMIN_PORT/v3/  --bootstrap-public-url http://$CONTROLLER_HNAME:$KEYSTONE_USER_PORT/v3/ --bootstrap-region-id $region",
        user => 'root',
    } ->

    notify {"Creating Script for Keystone  user/tenant creation":} ->
    file { '/tmp/keystone-init-user.sh':
        content => template('openstack-keystone/keystone-init-user.sh'),
        mode => 0755,
    } -> 
  
    notify {"Executing Script for openstack user creation":} ->
    exec {"Executing Script for openstack user creation":
        command => 'bash /tmp/keystone-init-user.sh',
        user => 'root'
    }
}
