class openstack-neutron::neutron-compute::neutron-compute-config {

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
     $INSTANCE_TUNNEL_IP = "$ipaddress_enp0s8"

     notify {"CREATING ml2_conf.ini FILE":} ->
        file { "/etc/neutron/plugins/ml2/ml2_conf.ini":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-compute/ml2.conf.erb')
      } ->
  
     notify {"Adding configurations for Neutron in nova.conf for compute node":} ->

     file_line { 'Appending in [DEFAULT] in nova.conf':
         path  => '/etc/nova/nova.conf',
         line  => 'verbose = True
         network_api_class = nova.network.neutronv2.api.API
         security_group_api = neutron
         linuxnet_interface_driver = nova.network.linux_net.LinuxOVSInterfaceDriver
         firewall_driver = nova.virt.firewall.NoopFirewallDriver',
         match => '^verbose',
   } ->

   file_line { 'Appending in [NEUTRON] in nova.conf':
         path  => '/etc/nova/nova.conf',
         line  => "url = http://${CONTROLLER_HNAME}:9696
         auth_strategy = keystone
         admin_auth_url = http://${CONTROLLER_HNAME}:35357/v2.0
         admin_tenant_name = service
         admin_username = neutron
         admin_password = ${ADMIN_PASSWORD}",
         match => '^#url=http://127.0.0.1:9696',
   }      
   
}   

