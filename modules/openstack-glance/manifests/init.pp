class openstack-glance {
    include openstack-glance::keystone
    include openstack-glance::glance
}
