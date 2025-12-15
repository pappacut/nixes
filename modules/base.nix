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
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelParams = [
    "zswap.enabled=1"
    "zswap.compressor=zstd"
    "zswap.max_pool_percent=20"
    "zswap.shrinker_enabled=1"
  ];

  system.nixos-init.enable = true;

  # ---------------------------------------------------------
  # Hardware & Firmware
  # ---------------------------------------------------------
  # Essential for modern hardware support (Wifi, etc.)
  hardware.enableRedistributableFirmware = true;

  hardware.graphics.enable = true;

  # ---------------------------------------------------------
  # Localization
  # ---------------------------------------------------------
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";
  console.keyMap = "de-latin1-nodeadkeys";

  # ---------------------------------------------------------
  # System Features
  # ---------------------------------------------------------
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  systemd.enableStrictShellChecks = true;
}
