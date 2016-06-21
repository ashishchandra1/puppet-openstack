class openstack-keystone::keystone-httpd-operations inherits openstack-keystone::params {
    
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

    notify {"Enabling memcached service":} ->
    exec {"Enable memcached service":
        command => 'systemctl enable memcached.service',
        user => 'root',
    } ->

    notify {"Starting memcached service":} ->
    exec {"Start memcached service":
        command => 'systemctl start memcached.service',
        user => 'root',
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
