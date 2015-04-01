class mariadb-galera::disable-selinux {

 #SELINUX PERMISSIVE  MODE
 notify {"SELINUX PERMISSIVE MODE": } ->
 exec {"selinux permissive":
  path => ["/usr/bin/","/usr/sbin/","/bin"],
  command => "setenforce 0",
  user => 'root',
  }
 
}
