class openstack-nova::nova-controller-operations {
     notify {"Enabling Nova Service":} ->
     exec {"Enable Nova Services":
          command => 'systemctl enable openstack-nova-api.service openstack-nova-consoleauth.service openstack-nova-scheduler.service  openstack-nova-conductor.service openstack-nova-novncproxy.service',
          user => 'root',
          } ->

     notify {"Starting Nova Services":} ->
     exec {"start Nova Services":
          command => 'systemctl start openstack-nova-api.service openstack-nova-consoleauth.service openstack-nova-scheduler.service  openstack-nova-conductor.service openstack-nova-novncproxy.service',
          user => 'root',
          }
}
