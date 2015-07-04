class haproxy-keepalived::install_keepalived_ha2 inherits haproxy-keepalived::params {

    exec {"Installing keepalived":
        command =>"yum install keepalived -y",
        user => 'root',
    } ->

    notify {"CREATING keepalived.conf FILE on haproxy2":} ->
    file { "/etc/keepalived/keepalived.conf":
         ensure  => file,
         owner  => root,
         group  => root,
         mode => 644,
         content => template('haproxy-keepalived/keepalived.conf.ha2.erb'),
    }
}
