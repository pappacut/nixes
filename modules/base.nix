{
  config,
  pkgs,
  lib,
  ...
}:
{
  # ---------------------------------------------------------
  # Nixpkgs Configuration
  # ---------------------------------------------------------
  nixpkgs.config.allowUnfree = true;

  # ---------------------------------------------------------
  # Boot & Kernel
  # ---------------------------------------------------------
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 10;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  system.nixos-init.enable = true;

  # ---------------------------------------------------------
  # Memory Management
  # ---------------------------------------------------------
  zramSwap.enable = true;

  # ---------------------------------------------------------
  # Hardware, Firmware & Graphics
  # ---------------------------------------------------------
  hardware.enableRedistributableFirmware = true;
  hardware.graphics.enable = true;

  # ---------------------------------------------------------
  # Localization
  # ---------------------------------------------------------
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    keyMap = "de-latin1-nodeadkeys";
    font = "Lat2-Terminus16";
  };

  # ---------------------------------------------------------
  # System Features
  # ---------------------------------------------------------
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  systemd.enableStrictShellChecks = true;
}
