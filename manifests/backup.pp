class zimbra::backup(
  hour => 23,
  minute => 00
) {
  file{'/usr/local/sbin/zimbra-backup.sh':
    source => "puppet://$server/modules/zimbra/",
    owner => root, group => root, mode => 0555,
  }
  cron::crond{'zimbra-backup':
    user => root,
    command => '/usr/local/sbin/zimbra-backup.sh',
    hour => $hour,
    minute => $minute,
  }
}