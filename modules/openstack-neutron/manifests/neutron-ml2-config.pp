class openstack-neutron::neutron-ml2-config {

    notify {"CREATING ml2_conf.ini FILE":} ->
      file { "/etc/neutron/plugins/ml2/ml2_conf.ini":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-controller/ml2.conf.erb') 
    } ->

    notify {"Creating Symbolic link":} ->

    file {'/etc/neutron/plugin.ini':
        ensure => link,
        target => '/etc/neutron/plugins/ml2/ml2_conf.ini',  
    }
}

