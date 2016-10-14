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

        demo_compute1, demo_compute2: {
            class {'neutron-compute::neutron-compute-installation':} ->
            class {'neutron-compute::neutron-compute-operations':}
        }
    }
}
