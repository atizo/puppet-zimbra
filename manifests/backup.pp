class zimbra::backup(
  $hour = 23,
  $minute = 00
) {
  include zimbra
  file{'/usr/local/sbin/zimbra-backup.sh':
    source => "puppet://$server/modules/zimbra/zimbra-backup.sh",
    owner => root, group => root, mode => 0555,
  }
  cron::crond{'zimbra-backup':
    user => root,
    command => '/usr/local/sbin/zimbra-backup.sh',
    hour => $hour,
    minute => $minute,
  }
}
