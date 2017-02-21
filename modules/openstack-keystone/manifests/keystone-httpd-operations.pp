class openstack-keystone::keystone-httpd-operations inherits openstack-keystone::params {
    
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
        command => 'systemctl start httpd.service',
        user => 'root',
    }
}
