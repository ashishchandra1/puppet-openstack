class openstack-neutron {
    case $hostname {
        openstack_controller1: {
            class {'create-neutron-db':} ->
            class {'keystone_operations':} ->
            class {'neutron-controller-installation':} ->
            class {'neutron-db-sync':} ->
            class {'neutron-controller-operations':}
        }

        openstack_controller2, openstack_controller3: {
            class {'neutron-controller-installation':} ->
            class {'neutron-controller-operations':}
        }

        openstack_compute1, openstack_compute2: {
            class {'neutron-compute::neutron-compute-installation':} ->
            class {'neutron-compute::neutron-compute-operations':}
        }
    }
}
