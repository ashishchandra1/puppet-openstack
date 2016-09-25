class openstack-keystone::initiate-keystone inherits openstack-keystone::params {

    notify {"Create KEYSTONE Service and Service Endpoint":} ->
    file { "/tmp/keystone-service-endpoint.sh":
        content => template('openstack-keystone/keystone-service-endpoint.sh'),
        mode => 0755,
    } ->
  
    notify {"Executing Script for Keystone Endpoint":} ->
    exec {"Executing Script for keystone endpoint creation":
        path => ["/usr/bin/","/usr/sbin/","/bin"],
        command => 'bash /tmp/keystone-service-endpoint.sh',
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
