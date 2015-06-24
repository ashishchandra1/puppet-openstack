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
    }
}
