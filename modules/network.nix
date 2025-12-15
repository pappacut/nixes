{
  networking.networkmanager.enable = true;
  users.users.patrick.extraGroups = [ "networkmanager" ];
  networking.networkmanager.wifi.powersave = true; # todo: only if laptop
}
