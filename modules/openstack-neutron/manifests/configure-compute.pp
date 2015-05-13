class openstack-neutron::configure-compute {
   
   $CONTROLLER_HNAME = "controller"
   $NEUTRON_ADMIN_PASSWORD = "@dmin123"
   $METADATA_SECRET = '@dmin123'

   notify {"Adding configurations for Neutron in [DEFAULT] section":} ->
  
   file_line { 'network_api_class':
         path  => '/etc/nova/nova.conf',
         line  => 'network_api_class=nova.network.neutronv2.api.API',
         match => '^#network_api_class',
   } ->

   file_line {'security_group_api': 
         path  => '/etc/nova/nova.conf',
         line  => 'security_group_api = neutron',
         match => '^#security_group_api',
   } ->

   file_line { 'linuxnet_interface_driver':
         path  => '/etc/nova/nova.conf',
         line  => 'linuxnet_interface_driver=nova.network.linux_net.LinuxOVSInterfaceDriver',
         match => '^#linuxnet_interface_driver',
   } ->

   file_line { 'firewall_driver':
         path  => '/etc/nova/nova.conf',
         line  => 'firewall_driver=nova.virt.firewall.NoopFirewallDriver',
         match => '^#firewall_driver',
   } ->

   notify {"Adding configurations for Neutron in [neutron] section":} ->

   file_line { 'url':
         path  => '/etc/nova/nova.conf',
         line  => "url=http://${CONTROLLER_HNAME}:9696",
         match => '^#url=http://127.0.0.1:9696',
   } ->

   file_line { 'auth_strategy':
         path  => '/etc/nova/nova.conf',
         line  => 'auth_strategy = keystone',
         match => '^# Deprecated group;name - DEFAULT;neutron_auth_strategy',
   } ->

   file_line { 'admin_auth_url':
         path  => '/etc/nova/nova.conf',
         line  => "admin_auth_url=http://${CONTROLLER_HNAME}:35357/v2.0",
         match => '^#admin_auth_url',
   } ->

  file_line { 'admin_tenant_name':
         path  => '/etc/nova/nova.conf',
         line  => 'admin_tenant_name = service',
         match => '^# Deprecated group;name - DEFAULT;neutron_admin_tenant_name',
   } ->

  file_line { 'admin_username':
         path  => '/etc/nova/nova.conf',
         line  => 'admin_username=neutron',
         match => '^# Deprecated group;name - DEFAULT;neutron_admin_username',
  } ->

  file_line { 'admin_password':
         path  => '/etc/nova/nova.conf',
         line  => "admin_password=${NEUTRON_ADMIN_PASSWORD}",
         match => '^# Deprecated group;name - DEFAULT;neutron_admin_password',
   }

}
