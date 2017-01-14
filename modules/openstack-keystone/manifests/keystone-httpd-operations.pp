class openstack-keystone::keystone-httpd-operations inherits openstack-keystone::params {
    
    notify {"Initialize Fernet Keys Keystone":} ->
    exec {"Fernet Keys Setup":
        command => "keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone",
        user => 'root',
    } ->
    
     exec {"Fernet Credetial Setup":
        command => "keystone-manage credential_setup --keystone-user keystone --keystone-group keystone",
        user => 'root',
    } ->

    file { "/etc/httpd/conf/httpd.conf":
       ensure  => file,
       owner  => root,
       group  => root,
       content => template('openstack-keystone/httpd.conf.erb'),
    } ->

    notify {"Creating Symbolic link":} ->
    file {'/usr/share/keystone/wsgi-keystone.conf':
        ensure => link,
        target => '/etc/httpd/conf.d/',
    }

    file { "/etc/httpd/conf.d/wsgi-keystone.conf":
       ensure  => file,
       owner  => root,
       group  => root,
       content => template('openstack-keystone/wsgi-keystone.conf.erb'),
    } ->

    notify {"Enabling HTTPD Service":} ->
    exec {"Enable HTTPD Services":
        command => 'systemctl enable httpd.service',
        user => 'root',
    } ->

    notify {"Starting HTTPD Service":} ->
    exec {"Start HTTPD Services":
        command => 'systemctl start httpd.service',
        user => 'root',
    }
}
