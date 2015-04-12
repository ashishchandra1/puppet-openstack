class openstack-dashboard::dashboard-installation {

     $OPENSTACK_HOST = "controller"
     $ADMIN_TOKEN = '@dmin123'
     
     notify {"Installing Openstack dashboard packages":} ->
     $packages = [
              "openstack-dashboard",
              "httpd",
              "mod_wsgi",
              "memcached",
              "python-memcached"
     ]
   
     package {
           $packages:
          ensure =>installed,
    }

}
