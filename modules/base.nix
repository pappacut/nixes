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

  boot.initrd.systemd.enable = true;

  # system.nixos-init.enable = true;
  # system.etc.overlay.enable = true;

  boot.tmp = {
    useTmpfs = true;
    tmpfsHugeMemoryPages = "within_size";
  };

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

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = [
      "en_US.UTF-8/UTF-8"
      "de_DE.UTF-8/UTF-8"
    ];

    extraLocaleSettings = {
      # 3. Force English for the interface text
      LC_MESSAGES = "en_US.UTF-8";

      # 4. Force German for formatting (Time, Date, Currency, etc.)
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };
  };

  console = {
    keyMap = "de-latin1-nodeadkeys";
    packages = [ pkgs.terminus_font ];
    font = "${pkgs.terminus_font}/share/consolefonts/ter-v24b.psf.gz";
  };

  services.xserver.xkb = {
    layout = "de";
    variant = "";
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
