class openstack-neutron::configure-compute {
   
   $CONTROLLER_HNAME = "controller"
   $NOVA_ADMIN_PASS = "@dmin123"
   $METADATA_SECRET = '@dmin123'

   notify {"Adding configurations for Neutron":} ->
  
   file_line { 'Appending in [DEFAULT]':
         path  => '/etc/nova/nova.conf',
         line  => 'verbose = True
         network_api_class = nova.network.neutronv2.api.API
         security_group_api = neutron
         linuxnet_interface_driver = nova.network.linux_net.LinuxOVSInterfaceDriver
         firewall_driver = nova.virt.firewall.NoopFirewallDriver',
         match => '^verbose',
   } ->

   file_line { 'Appending in [NEUTRON]':
         path  => '/etc/nova/nova.conf',
         line  => "url = http://${CONTROLLER_HNAME}:9696
         auth_strategy = keystone
         admin_auth_url = http://${CONTROLLER_HNAME}:35357/v2.0
         admin_tenant_name = service
         admin_username = neutron
         admin_password = ${NOVA_ADMIN_PASS}",
         service_metadata_proxy = True
         metadata_proxy_shared_secret = ${METADATA_SECRET}
         match => '^#url=http://127.0.0.1:9696',
   } 

}
