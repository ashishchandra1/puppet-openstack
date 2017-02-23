class openstack-keystone::keystone-operations inherits openstack-keystone::params {

    notify {"Setting up Fernet Token Provider":} ->
    exec {"Fernet Setup":
        command => 'keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone',
        user => 'root',
    } ->

    notify {"Setting up Credentials":} ->
    exec {"Credential Setup":
        command => 'keystone-manage credential_setup --keystone-user keystone --keystone-group keystone',
        user => 'root',
    } ->
    
    file { "/etc/httpd/conf/httpd.conf":
       ensure  => file,
       owner  => root,
       group  => root,
       content => template('openstack-keystone/httpd.conf.erb'),
    } ->

    notify {"Creating Symbolic link":} ->
    file {'/etc/httpd/conf.d/wsgi-keystone.conf':
        ensure => link,
        target => '/usr/share/keystone/wsgi-keystone.conf',
    } ->

    notify {"Enabling HTTPD Service":} ->
    exec {"Enable HTTPD Services":
        command => 'systemctl enable httpd.service',
        user => 'root',
    } ->

    notify {"Starting HTTPD Service":} ->
    exec {"Start HTTPD Services":
        command => 'systemctl restart httpd.service',
        user => 'root',
    }
}
