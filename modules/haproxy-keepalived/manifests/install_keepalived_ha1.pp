class haproxy-keepalived::install_keepalived_ha1 inherits haproxy-keepalived::params {

    exec {"Installing keepalived":
        command =>"yum install keepalived -y",
        user => 'root',
    } ->

    notify {"CREATING keepalived.conf FILE on haproxy1":} ->
    file { "/etc/keepalived/keepalived.conf":
         ensure  => file,
         owner  => root,
         group  => root,
         mode => 644,
         content => template('haproxy-keepalived/keepalived.conf.ha1.erb'),
    }
}
