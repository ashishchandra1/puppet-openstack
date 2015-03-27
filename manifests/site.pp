include ntp


node 'controller1' {
   include openstack_packages
}

node 'controller2' {
   include openstack_packages
}
