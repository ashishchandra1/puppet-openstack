class mariadb {
    class {'mariadb':} -> class{'galera':} -> class{'keystone':} -> class{'glance':} -> class{'cinder':}
}
