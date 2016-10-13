class openstack-neutron::neutron-controller-installation inherits openstack-neutron::params {

    notify {"Installing Openstack Neutron on Controller Nodes":} ->
    package {
        $neutron_controller_packages: 
        ensure =>installed,
        before => File['/etc/neutron/neutron.conf'],
    } -> 

    notify {"CREATING neutron.conf FILE":} ->
    file { "/etc/neutron/neutron.conf":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-controller/neutron.conf.erb'),
    } ->

    notify {"CREATING ml2_conf.ini FILE":} ->
    file { "/etc/neutron/plugins/ml2/ml2_conf.ini":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-controller/ml2_conf.ini.erb') 
    } ->

    notify {"Creating Linux Bridge agent ":} ->
    file { "/etc/neutron/plugins/ml2/linuxbridge_agent.ini":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-controller/linuxbridge_agent.ini.erb')
    } ->

    notify {"Configuring L3 agent ":} ->
    file { "/etc/neutron/l3_agent.ini":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-controller/l3_agent.ini.erb')
    } ->

    notify {"Configuring DHCP agent ":} ->
    file { "/etc/neutron/dhcp_agent.ini":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-controller/dhcp_agent.ini.erb')
    } ->

    notify {"Configuring Metadata agent ":} ->
    file { "/etc/neutron/metadata_agent.ini":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-controller/metadata_agent.ini.erb')
    } ->

    notify {"Creating Symbolic link":} ->
    file {'/etc/neutron/plugin.ini':
        ensure => link,
        target => '/etc/neutron/plugins/ml2/ml2_conf.ini',  
    }
}
