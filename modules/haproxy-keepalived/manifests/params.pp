class haproxy-keepalived::params {
    $VIRTUAL_IP     = "192.168.213.100"
    $CONTROLLER1_IP = "192.168.213.42"
    $CONTROLLER2_IP = "192.168.213.43"
    $CONTROLLER3_IP = "192.168.213.44"
    
    $ROUTER_ID_HA1  = "openstack_haproxy1"
    $ROUTER_ID_HA2  = "openstack_haproxy2"
    $INTERFACE_HA1  = "bond0.213"
    $INTERFACE_HA2  = "team0.213"
    $PRIORITY_HA1   = "101"
    $PRIORITY_HA2   = "100"

 }
