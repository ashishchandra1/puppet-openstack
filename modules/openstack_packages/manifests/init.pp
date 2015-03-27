class openstack_packages {
   notify {"Installing yum-plugin-priorities":} ->
   package { 'yum-plugin-priorities':
       ensure => installed,
   } ->
   
   notify {"Installing epel-release ":} ->
   package { "epel-release":
     ensure => installed,
     provider => rpm,
     source => "http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm",
    allow_virtual => false,
   } ->

  notify {"Installing RDO juno release packages":} ->
  package {"rdo-release-juno":
     ensure => installed,
     provider => rpm,
     source => "http://rdo.fedorapeople.org/openstack-juno/rdo-release-juno.rpm",
     allow_virtual => false,
  }
   
}
