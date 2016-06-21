class openstack-keystone::initiate-keystone inherits openstack-keystone::params {

    notify {"Create KEYSTONE Service and Service Endpoint":} ->
    file { "/tmp/keystone-service-endpoint.sh":
        content => template('openstack-keystone/endpoint-initialise.sh'),
        mode => 0755,
    } ->
  
    notify {"Executing Script for keystone enpoint":} ->
    exec {"Executing Script for keystone endpoint creation":
        path => ["/usr/bin/","/usr/sbin/","/bin"],
        command => 'bash /tmp/keystone-service-endpoint.sh',
        user => 'root',
    } ->

    notify {"Creating Script for Keystone  user/tenant creation":} ->
    file { '/tmp/keystone-create-user.sh':
        content => template('openstack-keystone/keystone-initialise-user.sh'),
        mode => 0755,
    } -> 
  
    notify {"Executing Script for openstack user creation":} ->
    exec {"Executing Script for openstack user creation":
        command => 'bash /tmp/keystone-create-user.sh',
        user => 'root'
    }
}
