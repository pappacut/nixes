{ config, ... }:

{
  # 1. Mount für "Daten"
  fileSystems."/mnt/synology/backups" = {
    device = "192.168.73.202:/volume1/Backup_Data";
    fsType = "nfs";
    # Die Optionen für Automount (identisch zur fstab-Lösung, nur als Liste)
    options = [
      "x-systemd.automount"
      "noauto"
      "x-systemd.idle-timeout=60"
      "rw"   # oder "ro" für read-only
    ];
  };
  # ...
}
