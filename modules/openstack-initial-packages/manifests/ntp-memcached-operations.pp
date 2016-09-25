class openstack-initial-packages::ntp-memcached-operations {

    notify {"Enabling NTPD Service":} ->
    exec {"Enable NTPD Services":
          command => 'systemctl enable ntpd.service',
          user => 'root',
    } ->
 
    notify {"Starting NTPD Service":} ->
    exec {"Start NTPD Services":
          command => 'systemctl start ntpd.service',
          user => 'root',
    } ->

    notify {"Enabling Memcached Service":} ->
    exec {"Enable Memcached Services":
          command => 'systemctl enable memcached.service',
          user => 'root',
    } ->
 
    notify {"Starting Memcached Service":} ->
    exec {"Start Memcached Services":
          command => 'systemctl start memcached.service',
          user => 'root',
    }
}
