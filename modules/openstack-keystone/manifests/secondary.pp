# == Class: keystone
# Author <raza.aamir01@gmail.com>
# Copyright 2015 Your name here, unless otherwise noted.
#


class openstack-keystone::secondary {

   #TODO Cater these into configs
   # Register service and endpoints for keystone in keystone.
   $KEYSTONE_HOST = $ipaddress
   $KEYSTONE_ADMIN_PORT = "35357" 
   $ADMIN_TOKEN = '@dmin123'
   $KEYSTONE_PUBLIC_PORT = "5000"

   #Variables for create service and endpoints
   $region = "regionOne"
   $service_name = 'keystone'
   $service_type = 'identity'
   $service_description  = 'Keystone Identity Service'
   $service_public_url   = "http://${KEYSTONE_HOST}:${KEYSTONE_PUBLIC_PORT}/v2.0/"
   $service_internal_url = "http://${KEYSTONE_HOST}:${KEYSTONE_PUBLIC_PORT}/v2.0/"
   $service_admin_url    = "http://${KEYSTONE_HOST}:${KEYSTONE_ADMIN_PORT}/v2.0/"

   #Variables for TESTING puppet agent file creation
   $say_hello_to = 'aamir' 
   $myname = 'file03'

   #Variables for keystone.conf file
   $conf_name = 'keystone.conf'
   #$ADMIN_TOKEN = '@dmin123'
   $KEYSTONE_DBPASS = '@dmin123'
   #TODO USING PUPPET FACTER FOR GETTING HOSTNAME
   $CONTROLLER_HNAME = $hostname
   $REVOCATION_DRIVER = 'sql'
   $BOOL_VALUE = "True"
   
   $SERVICE_TOKEN=$ADMIN_TOKEN
   $SERVICE_ENDPOINT="http://${KEYSTONE_HOST}:${KEYSTONE_ADMIN_PORT}/v2.0/" 
   $enhancers = [ "systemctl enable openstack-keystone.service", "systemctl start  openstack-keystone.service" ]
   
   #Variables To create tenants, users, and roles
   $admin_tenant = "admin"
   $admin_user =  "admin"
   $admin_user_pass = "@dmin123"

   notify {"Installing keystone":} ->
   package { 'openstack-keystone':
       ensure => installed,
   } ->

  notify {"Installing keystone client":} ->
   package { 'python-keystoneclient':
       ensure => installed,
   } ->

   notify {"CREATING KEYSTONE.CONF FILE":} ->
   file { "/etc/keystone/$conf_name":
    ensure  => file,
    owner  => root,
    group  => keystone,
    content => template('openstack-keystone/keystone-temp.erb'),
   } ->
  
  notify {"Create generic certificates and keys":} -> 
    exec {"Create generic certificates and keys":
    path => ["/usr/bin/","/usr/sbin/","/bin"],
    command => "keystone-manage pki_setup --keystone-user keystone --keystone-group keystone",
    user => 'root',
    require => Package["python-keystoneclient"],
  } ->
  
  notify {"Restrict Access to Keystone Logs":} ->
    exec {"Restrict Access to Keystone Logs":
    path => ["/usr/bin/","/usr/sbin/","/bin"],
    command => "chown -R keystone:keystone /var/log/keystone",
    user => 'root',
    require =>  Package["python-keystoneclient"],
  } ->

  notify {"Restrict Access to Keystone SSL":} ->
    exec {"Restrict Access to Keystone SSL":
    path => ["/usr/bin/","/usr/sbin/","/bin"],
    command => "chown -R keystone:keystone /etc/keystone/ssl",
    user => 'root',
    require =>  Package["python-keystoneclient"],
  } ->
 
  notify {"Restrict Access to Keystone SSL files":} ->
  exec {"Restrict keystone ssl":
    path => ["/usr/bin/","/usr/sbin/","/bin"],
    command => "chmod -R o-rwx /etc/keystone/ssl",
    user => 'root',
    require =>  Package["python-keystoneclient"],
  } ->
  
  # 
  notify {"Enabled Openstack Service":} ->
  exec {"Enabled Openstack Services": 
    command => 'systemctl enable openstack-keystone.service',
    user => 'root',
    require =>  Package["python-keystoneclient"],
  } ->

  notify {"Restart Openstack Services":} ->
  exec {"Restart Openstack Services": 
    command => 'systemctl restart openstack-keystone.service',
    user => 'root',
    require =>  Package["python-keystoneclient"],
  } ->
 
  notify {"Create KEYSTONE Service and Service Endpoint":} ->
  file { "/tmp/keystone-service-endpoint.sh":
      content => template('openstack-keystone/endpoint-init.sh'),
      mode    => 0755,
    } ->
  
  #Execute script for keystone endpoint
  notify {"Executing Script for keystone enpoint":} ->
  exec {"Executing Script for keystone endpoint creation":
    path => ["/usr/bin/","/usr/sbin/","/bin"],
    command => 'bash /tmp/keystone-service-endpoint.sh',
    user => 'root',
  }  
  
  




}



