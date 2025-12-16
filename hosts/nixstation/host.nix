{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix

    ../../modules/hardware/amd.nix

    ./services/syncthing.nix
  ];

  system.stateVersion = "25.11";

  networking.hostName = "nixstation";
  networking.domain = "lan";
  networking.search = [ "lan" ];
}
