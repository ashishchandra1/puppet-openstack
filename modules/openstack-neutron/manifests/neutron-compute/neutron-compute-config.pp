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

    notify {"CREATING ml2_conf.ini FILE":} ->
        file { "/etc/neutron/plugins/ml2/ml2_conf.ini":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-compute/ml2_conf.ini.erb')
    } -> 

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
        match => '^#auth_strategy=keystone',
     } ->

    file_line { 'admin_auth_url':
        path  => '/etc/nova/nova.conf',
        line  => "admin_auth_url=http://${CONTROLLER_HNAME}:35357/v2.0",
        match => '^#admin_auth_url',
    } ->

    file_line { 'admin_tenant_name':
        path  => '/etc/nova/nova.conf',
        line  => 'admin_tenant_name = service',
        match => '^#admin_tenant_name=<None>',
    } ->

    file_line { 'admin_username':
        path  => '/etc/nova/nova.conf',
        line  => 'admin_username=neutron',
        match => '# Username for connecting to neutron in admin context',
    } ->

    file_line { 'admin_password':
        path  => '/etc/nova/nova.conf',
        line  => "admin_password=${ADMIN_PASSWORD}",
        match => '^# Password for connecting to neutron in admin context',
    }
}   

