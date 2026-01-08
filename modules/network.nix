{ pkgs, ... }:
{
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openvpn
    ];
  };

  users.users.p0v0.extraGroups = [ "networkmanager" ];
}
