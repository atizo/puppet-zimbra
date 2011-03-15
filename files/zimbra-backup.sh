#!/bin/bash

ZIMBRAROOT=/opt/zimbra/
BACKUPDIR=/opt/zimbra-backup/
RSYNC_CMD="rsync -aSH --delete $ZIMBRAROOT $BACKUPDIR"

# online rsync
$RSYNC_CMD
 
# offline rsync
/etc/init.d/zimbra stop 2> /dev/null
$RSYNC_CMD
/etc/init.d/zimbra start 2> /dev/null
