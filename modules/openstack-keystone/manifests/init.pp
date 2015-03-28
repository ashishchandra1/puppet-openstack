# == Class: keystone
#
# Full description of class keystone here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'keystone':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class openstack-keystone {

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

   notify {"TESTING FILE":} ->
   file { "/tmp/$myname":
    ensure  => file,
    owner  => root,	
    group  => keystone,
    content => template('openstack-keystone/polite-file.erb'),
   } ->
   #Test for getting ip
   notify {"TESTING IP ADDRESS FILE":} ->
   file { "/tmp/ipaddr":
    ensure  => file,
    owner  => root,
    group  => root,
    content => template('openstack-keystone/test.erb'),
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
  
  # DB SYNCED
  notify {"CREATING SHELL SCRIPT FOR DB SYNCED":} ->
  file { '/tmp/keystone-init-db.sh':
    content => template('openstack-keystone/keystone-init-db.sh'),
    mode    => 0755,
  } ->

  #TODO NEEDS TO ADD COMMAND FOR EXECTUING SCRIPT DB INIT
   notify {"DB SYNCED USING SHELL SCRIPT":} ->
   exec {"Executing script for DB synced":
    path => ["/usr/bin/","/usr/sbin/","/bin"],
    command => "bash /tmp/keystone-init-db.sh",
    user => 'root',
  } ->
  
  # DB SYNCED USING COMMAND
  notify {"DB synced For Keystone":} ->
  exec {"DB synced For Keystone":
    path => ["/usr/bin/","/usr/sbin/","/bin"],
    command => "su -s /bin/sh -c 'keystone-manage db_sync' keystone",
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
 
  #Creating script for keystone user creation
  notify {"Creating Script for openstack user creation":} ->
  file { '/tmp/keystone-create-user.sh':
    content => template('openstack-keystone/keystone-init-user.sh'),
    mode    => 0755,
  } -> 
  
  #Execute script for keystone user creation
  notify {"Executing Script for openstack user creation":} ->
  exec {"Executing Script for openstack user creation":
     path => ["/usr/bin/","/usr/sbin/","/bin"],
    command => 'bash /tmp/keystone-create-user.sh',
    user => 'root',
    require =>  Package["python-keystoneclient"],
  } ->
  

  #Create Service and Service Endpoint 
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



