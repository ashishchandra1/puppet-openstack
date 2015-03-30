class mariadb {
     class {'mariadb':} -> class{'keystone':} -> class{'glance':} -> class{'cinder':} -> class{'nova_controller':}
}
