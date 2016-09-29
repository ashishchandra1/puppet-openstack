class openstack-dashboard::dashboard-operations {

    notify {"Enable web server and session storage service":} ->
    exec {"Enable webserver":
         command => 'systemctl enable httpd.service memcached.service',
         user => 'root',
      } ->

    notify {" Start web server and session storage service":} ->
    exec {"Starting httpd and memcached":
        command => 'systemctl restart httpd.service memcached.service ',
        user => 'root',
     }
}
