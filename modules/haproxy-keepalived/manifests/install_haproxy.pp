class haproxy-keepalived::install_haproxy inherits haproxy-keepalived::params {

    notify {"Set SELINUX in permissive mode": } ->
    exec {"selinux permissive":
        command => "setenforce 0",
        user => 'root',
    } ->

    notify {"Configure kernel networking parameter":} ->
    file { "/etc/sysctl.conf":
        ensure  => file,
        owner  => root,
        content => template('haproxy-keepalived/sysctl.conf.erb')
    } ->

    exec {"Configure kernel networking":
        command =>"sysctl -p",
        user => 'root',
    } ->

    exec {"Installing haproxy":
        command =>"yum install haproxy -y",
        user => 'root',
    } ->

   notify {"CREATING haproxy.cfg FILE":} ->
   file { "/etc/haproxy/haproxy.cfg":
        ensure  => file,
        owner  => root,
        group  => root,
        mode   => 644,
        content => template('haproxy-keepalived/haproxy.cfg.erb'),
    } 
}
