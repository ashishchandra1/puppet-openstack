class openstack-neutron::neutron-controller-installation inherits openstack-neutron::params {

    notify {"Installing Openstack Neutron on Controller Nodes":} ->
    package {
        $neutron_controller_packages: 
        ensure =>installed,
    } -> 

    notify {"Creating and configuring  neutron.conf FILE":} ->
    file { "/etc/neutron/neutron.conf":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-controller/neutron.conf.erb'),
    } ->

    notify {"Creating and configuring  ml2_conf.ini FILE":} ->
    file { "/etc/neutron/plugins/ml2/ml2_conf.ini":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-controller/ml2_conf.ini.erb') 
    } ->

    notify {"Creating and configuring l3_agent.ini file":} ->
    file { "/etc/neutron/l3_agent.ini":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-controller/l3_agent.ini.erb')
    } ->

    notify {"Creating and configuring dhcp_agent.ini file ":} ->
    file { "/etc/neutron/dhcp_agent.ini":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-controller/dhcp_agent.ini.erb')
    } ->

    notify {"Creating and configuring metadata_agent.ini file ":} ->
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
