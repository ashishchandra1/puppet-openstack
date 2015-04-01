class openstack-keystone {

  notify {"Openstack keystone runs on Primary node": }  
  case $hostname {
        controller1: {
        class {'openstack-keystone::primary' :}
                    }
         }
  notify {"Openstack keystone runs on Secondary node": }
  case $hostname {
        controller2,controller3: {
        class {'openstack-keystone::secondary' :}
                    }
         }
  

}



