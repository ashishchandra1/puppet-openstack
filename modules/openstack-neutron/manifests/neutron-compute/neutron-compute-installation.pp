class openstack-neutron::neutron-compute::neutron-compute-installation {

     $CONTROLLER_HNAME = "controller"
     $ADMIN_PASSWORD = '@dmin123'
     $RABBIT_PASSWORD = '@dmin123'
 
     $VERBOSE = "True"
     $RABBIT_HOST = "controller"
    
     $packages = [
              "openstack-neutron-ml2",
              "openstack-neutron-openvswitch"
     ]
  
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
          $packages: 
          ensure =>installed,
    } -> 

    notify {"CREATING neutron.conf file on Compute Node":} ->
    file { "/etc/neutron/neutron.conf":
        ensure  => file,
        owner  => root,
        group  => neutron,
        content => template('openstack-neutron/neutron-compute/neutron.conf.erb'),
   }

}
