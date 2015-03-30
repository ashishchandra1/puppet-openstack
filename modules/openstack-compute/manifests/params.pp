# == Class: openstack-compute::params
#
# Author Name <arazaamir@gmail.com>
#
# Copyright 2015 Your name here, unless otherwise noted.
#
#Variables
# [*CONTROLLER_HNAME*]       : Takes Hostname of the server
# [*HOST_NANE*]              : Puppet facter for hostname
# [*ADMIN_TOKEN *]           : Admin token of keystone
# [*KEYSTONE_ADMIN_PORT*]    :Keystone admin port
# [*REGION*]                 : Keystone region
# [*RPC_BACKEND*]            : Backend For RPC calls
# [*RABBIT_HOST*]            : RabbitMQ Host
# [*RABBIT_PASSWORD*]        : RabbitMQ Password
# [*AUTH_STRATEGY*]          : Protocol use for authenticate 
# [*ADMIN_USER*]             : Administrator User
# [*ADMIN_PASSWORD*]         : Administator Password
# [*ADMIN_TENANT_NAME*]      : Administrator Tenant Name
# [*IDENTITY_URI*]           : URL for identity
# [*AUTH_URI*]               : AuthenticatioN URL
# [*MANAGEMENT_INTERFACE_IP*]: Management Interface IP
# [*VNC_SERVER_MGMT_IP*]     : VNC Management IP
# [*VNC_PROXY_MGMT_IP *]     : VNC Proxy Management IP
# [*GLANCE_HOST_IP*]         : Glance Hosted IP
# [*LOG_BOOL_VALUE*]         : True or False For Verbose Logs
# [*NOVA_USER*]              : Name of Nova User
# [*NOVA_USER_PASS*]         : Password for User
# [*NOVA_DBPASS*]            : Nova DB password
# [*SERVICE_TYPE*]           : Type of service
# [*SERVICE_NAME*]           : Service Name
# [*SERVICE_DESC*]           : Descrption of Service
# [*NOVA_PUBLIC_PORT*]       : Public port oF Nova
# [*SERVICE_PUBLIC_URL *]    : Service Public URL
# [*SERVICE_INTERNAL_URL*]   : Service Internal URL
# [*SERVICE_ADMIN_URL*]      : Service Admin URL



# This class takes all parameters for configuration of nova
class openstack-compute::params {
  $CONTROLLER_HNAME        = "controller02"
  $HOST_NANE               = $hostname
  $ADMIN_TOKEN             = '@dmin123'
  $KEYSTONE_ADMIN_PORT     = "35357"
  $REGION                  = "regionOne"
  $RPC_BACKEND             = "rabbit"
  $RABBIT_HOST             = "${CONTROLLER_HNAME }"
  $RABBIT_PASSWORD         = "guest"
  $AUTH_STRATEGY           = "keystone"
  $ADMIN_USER              = "nova"
  $ADMIN_PASSWORD          = "@dmin123"
  $ADMIN_TENANT_NAME       = "service"
  $IDENTITY_URI            = "http://${CONTROLLER_HNAME }:35357"
  $AUTH_URI                = "http://${CONTROLLER_HNAME }:5000/v2.0"
  $MANAGEMENT_INTERFACE_IP = $ipaddress
  $VNC_SERVER_MGMT_IP      = $ipaddress
  $VNC_PROXY_MGMT_IP       = $ipaddress
  $GLANCE_HOST_IP          = "${CONTROLLER_HNAME}"
  $LOG_BOOL_VALUE          = "True"

  $NOVA_USER               = "nova" 
  $NOVA_USER_PASS          = "@dmin123"
  $NOVA_DBPASS             = "@dmin123"
  $SERVICE_TYPE            = "compute"
  $SERVICE_NAME            = "nova"
  $SERVICE_DESC            = "Openstack Compute"
  $NOVA_PUBLIC_PORT        = "8774"
  $SERVICE_PUBLIC_URL      = "http://${CONTROLLER_HNAME}:${NOVA_PUBLIC_PORT}/v2/%(tenant_id)s"
  $SERVICE_INTERNAL_URL    = "http://${CONTROLLER_HNAME}:${NOVA_PUBLIC_PORT}/v2/%(tenant_id)s"
  $SERVICE_ADMIN_URL       = "http://${CONTROLLER_HNAME}:${NOVA_PUBLIC_PORT}/v2/%(tenant_id)s"
 
  }
 

