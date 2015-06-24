class openstack-neutron::neutron-network::neutron-network-config inherits openstack-neutron::params{

    notify {"CREATING ml2_conf.ini FILE":} ->
        file { "/etc/neutron/plugins/ml2/ml2_conf.ini":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-network/ml2_conf.ini.erb')
    } ->
  
    notify {"Creating Symbolic link on network node":} ->
    file {'/etc/neutron/plugin.ini':
        ensure => link,
        target => '/etc/neutron/plugins/ml2/ml2_conf.ini',  
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

