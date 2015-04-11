class openstack-neutron::neutron-ml2-config {

     $KEYSTONE_HOST = "controller"
     $KEYSTONE_ADMIN_PORT = '35357'
     $ADMIN_TOKEN = '@dmin123'
     
     $admin_tenant = "admin"
     $admin_user =  "admin"
     $admin_user_pass = "@dmin123"
     $region = "regionOne"

     
     notify {"CREATING ml2_conf.ini FILE":} ->
        file { "/etc/neutron/plugins/ml2/ml2_conf.ini":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-controller/ml2.conf.erb') 
   }

}

