class openstack-neutron::neutron-compute::neutron-compute-installation inherits openstack-neutron::params {

    notify {"Configure kernel networking parameter on Compute Node":} ->
    file { "/etc/sysctl.conf":
        ensure  => file,
        owner  => root,
        content => template('openstack-neutron/neutron-compute/sysctl.conf.erb')
    } ->
     
    exec {"Configure kernel networking on Compute node":
        command =>"sysctl -p",
        user => 'root',
    } -> 

    notify {"Installing Openstack Neutron on Compute Nodes":} ->
    package {
        $neutron_compute_packages: 
        ensure =>installed,
    } -> 

    notify {"CREATING neutron.conf file on Compute Node":} ->
    file { "/etc/neutron/neutron.conf":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-compute/neutron.conf.erb'),
   } ->

   notify {"CREATING ml2_conf.ini FILE":} ->
        file { "/etc/neutron/plugins/ml2/ml2_conf.ini":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-compute/ml2_conf.ini.erb')
    }
}
