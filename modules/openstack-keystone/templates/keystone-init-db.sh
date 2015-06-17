#!/bin/sh
# Create the database.
su -s /bin/sh -c "keystone-manage db_sync" keystone
