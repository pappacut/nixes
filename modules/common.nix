{ inputs, ... }:
{
  imports = [
    inputs.disko.nixosModules.disko

    ./administration.nix
    ./base.nix
    ./firewall.nix
    ./home-manager.nix
    ./network.nix
    ./nix.nix
    ./programs.nix
    ./system-packages.nix
  ];
}
