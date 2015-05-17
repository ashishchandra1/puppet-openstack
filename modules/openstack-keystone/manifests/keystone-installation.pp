class openstack-keystone::keystone-installation {

     $KEYSTONE_DBPASS = '@dmin123'
     $CONTROLLER_HNAME = "controller" 
     $VERBOSE = 'True' 
     $ADMIN_TOKEN = "@dmin123"        
     $packages = [
              "openstack-keystone",
              "python-keystoneclient"
     ]

     notify {"Installing Openstack glance packages":} ->
     package {
          $packages:
          ensure =>installed,
    } ->
   
    file { "/etc/keystone/keystone.conf":
       ensure  => file,
       owner  => root,
       group  => keystone,
       content => template('openstack-keystone/keystone.conf.erb'),
   }

   notify {"Create generic certificates and keys":} ->
   exec {"Create generic certificates and keys":
       command => "keystone-manage pki_setup --keystone-user keystone --keystone-group keystone",
       user => 'root',
       require => Package["python-keystoneclient"],
   } ->

   notify {"Restrict Access to Keystone Logs":} ->
   exec {"Restrict Access to Keystone Logs":
        command => "chown -R keystone:keystone /var/log/keystone",
        user => 'root',
        require =>  Package["python-keystoneclient"],
    } ->

   notify {"Restrict Access to Keystone SSL":} ->
   exec {"Restrict Access to Keystone SSL":
        command => "chown -R keystone:keystone /etc/keystone/ssl",
        user => 'root',
        require =>  Package["python-keystoneclient"],
   } ->

   notify {"Restrict Access to Keystone SSL files":} ->
   exec {"Restrict keystone ssl":
        command => "chmod -R o-rwx /etc/keystone/ssl",
        user => 'root',
        require =>  Package["python-keystoneclient"],
  }

}
