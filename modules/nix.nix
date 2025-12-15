{
  nix.gc = {
    automatic = true;
    persistent = true;
    dates = "12:00";
    options = "--delete-older-than 7d";
    randomizedDelaySec = "3h";
  };

  nix.optimise = {
    automatic = true;
    persistent = true;
    dates = [ "12:00" ];
    randomizedDelaySec = "3h";
  };

  nix.settings.trusted-users = [
    "root"
    "patrick"
  ];
}
