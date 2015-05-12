class initial-packages::ntp {
   package { 'ntp':
       ensure => installed,
   } ->
 
   service { 'ntp':
      name => ntpd,
      ensure => running,
      enable => true,
   }
}
