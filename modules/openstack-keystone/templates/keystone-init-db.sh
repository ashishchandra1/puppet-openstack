#!/bin/sh
# Create the database.
su -s /bin/sh -c "glance-manage db_sync" glance
