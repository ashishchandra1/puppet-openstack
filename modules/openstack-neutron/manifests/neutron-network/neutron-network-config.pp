class openstack-neutron::neutron-network::neutron-network-config {

     $KEYSTONE_HOST = "controller"
     $CONTROLLER_HNAME = "controller"
     $KEYSTONE_ADMIN_PORT = '35357'
     $ADMIN_TOKEN = '@dmin123'
     $ADMIN_PASSWORD = '@dmin123'
     $REGION = "regionOne"
     $METADATA_SECRET = '@dmin123'   
       
     $admin_tenant = "admin"
     $admin_user =  "admin"
     $admin_user_pass = "@dmin123"
     $INSTANCE_TUNNEL_IP = "$ipaddress_enp0s3"

     notify {"CREATING ml2_conf.ini FILE":} ->
        file { "/etc/neutron/plugins/ml2/ml2_conf.ini":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-network/ml2.conf.erb')
      } ->
  
      notify {"Creating Symbolic link on network node":} ->
      exec {"Creating Symbolic Link":
          command => "ln -s /etc/neutron/plugins/ml2/ml2_conf.ini /etc/neutron/plugin.ini",
           user =>'root',
      } ->    
 
     notify {"CREATING l3_agent.ini FILE":} ->
        file { "/etc/neutron/l3_agent.ini":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-network/l3_agent.ini.erb') 
     } ->

    notify {"CREATING dhcp_agent.ini FILE":} ->
        file { "/etc/neutron/dhcp_agent.ini":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-network/dhcp_agent.ini.erb')
     } ->

    notify {"CREATING dnsmasq.conf FILE":} ->
        file { "/etc/neutron/dnsmasq-neutron.conf":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-network/dnsmasq-neutron.conf.erb')
     } ->

    notify {"CREATING metadata_agent.ini FILE":} ->
       file { "/etc/neutron/metadata_agent.ini":
       ensure  => file,
       owner  => root,
       group  => neutron,
       content => template('openstack-neutron/neutron-network/metadata_agent.ini.erb')
     }
   
   
}   

