#!/bin/bash

ZIMBRAROOT=/opt/zimbra/
BACKUPDIR=/opt/zimbra-backup/
RSYNC_CMD="rsync -aSH --delete $ZIMBRAROOT $BACKUPDIR"

# online rsync
$RSYNC_CMD
 
# offline rsync
/etc/init.d/zimbra stop > /dev/null
$RSYNC_CMD
/etc/init.d/zimbra start > /dev/null

# monitor ldap for another 5 minutes
end=$(expr `date +%s` + 300)
while test `date +%s` -lt $end; do
  if ! lsof -i @195.141.111.119:389 | grep -q LISTEN; then
    su - zimbra -c "/opt/zimbra/bin/ldap start"
  fi
  sleep 1
done
