class openstack-keystone::initiate-keystone inherits openstack-keystone::params {

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
