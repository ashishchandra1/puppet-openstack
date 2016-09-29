class openstack-neutron {
    case $hostname {
        demo_controller1: {
            class {'create-neutron-db':} ->
            class {'keystone':} ->
            class {'neutron-controller-installation':} ->
            class {'neutron-db-sync':} ->
            class {'neutron-controller-operations':}
        }

        demo_controller2, demo_controller3: {
            class {'neutron-controller-installation':} ->
            class {'neutron-controller-operations':}
        }

        compute1, compute2, compute3, compute4, compute5, compute6, compute7, compute8, compute9: {
            class {'neutron-compute::neutron-compute-installation':} ->
            class {'neutron-compute::compute-ovs-operations':} ->
            class {'neutron-compute::neutron-compute-operations':}
        }
    }
}
