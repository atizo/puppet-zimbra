#!/bin/bash

ZIMBRAROOT=/opt/zimbra
BACKUPDIR=/opt/zimbra-backup
 
mkdir -p $BASEDIR/{ldap,accounts}
chmod 0700 $BASEDIR
chown -R zimbra:zimbra $BASEDIR

# backup ldap
su zimbra -c "/opt/zimbra/libexec/zmslapcat $BACKUPDIR/ldap"
 
# backup all accounts
for account in `su zimbra -c "$ZIMBRAROOT/bin/zmprov -l gaa | sort -R"`; do
  sleep 5;
  su zimbra -c "$ZIMBRAROOT/bin/zmmailbox -z -m $account getRestURL '//?fmt=tgz' > $BACKUPDIR/accounts/$account.tgz"
done
