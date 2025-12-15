{
  imports = [
    ./hardware-configuration.nix
    ./disko.nix

    ../../modules/hardware/amd.nix
  ];

  system.stateVersion = "25.11";
}
