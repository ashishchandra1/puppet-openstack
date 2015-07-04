class haproxy-keepalived::haproxy_keepalived_operations inherits haproxy-keepalived::params {

    notify {"Enabling Haproxy  Service":} ->
    exec {"Enabled haproxy Service to start at boot up`":
        command => 'systemctl enable haproxy.service',
        user => 'root',
    } ->
   
   notify {"Enabling Keepalived Service":} ->
   exec {"Enabled Keepalived to start at boot":
        command => 'systemctl enable keepalived.service',
        user => 'root',
   } ->

  exec {"Starting haproxy Service":
       command => 'systemctl start haproxy.service',
       user => 'root',
  } ->
 
  exec {"Starting Keepalived Service":
       command => 'systemctl start keepalived.service',
       user => 'root',
  }

}
