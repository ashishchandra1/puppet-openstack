class openstack-dashboard::dashboard-operations {
    notify {"Configure SELinux to permit webserver to connect Openstack Services":} ->
    exec {"Configure SElinux":
         command =>'setsebool -P httpd_can_network_connect on',
         user => 'root',
      } ->

    notify {"Resolve CSS bug that fails to load dashboard":} ->
    exec {"Resolve CSS bug":
         command =>'chown -R apache:apache /usr/share/openstack-dashboard/static',
         user => 'root',
      } ->


    notify {"Enable web server and session storage service":} ->
    exec {"Enable webserver":
         command => 'systemctl enable httpd.service memcached.service',
         user => 'root',
      } ->

    notify {" Start web server and session storage service":} ->
    exec {"Starting httpd and memcached":
        command => 'systemctl start httpd.service memcached.service ',
        user => 'root',
     }
}
