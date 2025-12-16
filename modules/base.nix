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
    consoleMode = "max";
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  system.nixos-init.enable = true;
  boot.initrd.systemd.enable = true;
  system.etc.overlay.enable = true;

  boot.tmp.useTmpfs = true;

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
    packages = [ pkgs.terminus_font ];
    font = "${pkgs.terminus_font}/share/consolefonts/ter-v24b.psf.gz";
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
