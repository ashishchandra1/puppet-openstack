class haproxy-keepalived::params {
    $VIRTUAL_IP     = "192.168.213.10"
    $CONTROLLER1_IP = "192.168.213.14"
    $CONTROLLER2_IP = "192.168.213.12"
    $CONTROLLER3_IP = "192.168.213.13"
    
    $ROUTER_ID_HA1  = "haproxy1"
    $ROUTER_ID_HA2  = "haproxy2"
    $INTERFACE_HA1  = "em1.213"
    $INTERFACE_HA2  = "em1.213"
    $PRIORITY_HA1   = "101"
    $PRIORITY_HA2   = "100"

 }
