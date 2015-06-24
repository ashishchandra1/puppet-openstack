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

    notify {"Create the directory structure for WSGI Components":} ->
    exec {"Creating directory":
        command => "mkdir -p /var/www/cgi-bin/keystone",
        user => 'root'
    } ->

    notify {"Copy the WSGI components from the upstream repository into this directory":} ->
    exec {"Copying the WSGI components":
        command => "curl http://git.openstack.org/cgit/openstack/keystone/plain/httpd/keystone.py?h=stable/kilo| tee /var/www/cgi-bin/keystone/main /var/www/cgi-bin/keystone/admin",
        user => 'root'
    } ->

    notify {"Adjust ownership ":} ->
    exec {"Adjusting ownership":
        command => "chown -R keystone:keystone /var/www/cgi-bin/keystone",
        user => 'root'
    } ->
  
    notify {"Adjust permissions ":} ->
    exec {"Adjusting permissions":
        command => "chmod 755 /var/www/cgi-bin/keystone/*",
        user => 'root'
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
