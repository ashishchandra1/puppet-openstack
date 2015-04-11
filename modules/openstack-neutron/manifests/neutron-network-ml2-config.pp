class openstack-neutron::neutron-network-ml2-config {

     $KEYSTONE_HOST = "controller"
     $KEYSTONE_ADMIN_PORT = '35357'
     $ADMIN_TOKEN = '@dmin123'
     
     $admin_tenant = "admin"
     $admin_user =  "admin"
     $admin_user_pass = "@dmin123"
     $region = "regionOne"
     $INSTANCE_TUNNEL_IP = "$ipaddress_enp0s8"

     
     notify {"CREATING ml2_conf.ini FILE":} ->
        file { "/etc/neutron/plugins/ml2/ml2_conf.ini":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-network/ml2.conf.erb') 
   } ->

    notify {"Creating Symbolic link":} ->
    exec {"Creating Symbolic Link":
          command => "ln -s /etc/neutron/plugins/ml2/ml2_conf.ini /etc/neutron/plugin.ini",
          user =>'root',
     } 
}

