class rabbitmq-ha::params {

   $RABBIT_USER = 'openstack'
   $RABBIT_PASSWORD = '2v04VsaRkZfr'
   $RABBIT_MASTER_NODE = 'openstack_controller1'

   $packages = [ 
        "rabbitmq-server"
    ]
 }
