class openstack-keystone::keystone-httpd-operations inherits openstack-keystone::params {
    
    notify {"Initialize Fernet Keys Keystone":} ->
    exec {"Initialising Fernet Keys":
        command => "keystone-manage fernet_setup --keystone-user keystone --keystone-group keystone",
        user => 'root',
    } ->

    file { "/etc/httpd/conf/httpd.conf":
       ensure  => file,
       owner  => root,
       group  => root,
       content => template('openstack-keystone/httpd.conf.erb'),
    } ->

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
