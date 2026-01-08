{
  pkgs,
  inputs,
  ...
}:
{
  # services.userborn.enable = true;

  users.mutableUsers = true;

  users.users.p0v0 = {
    isNormalUser = true;
    shell = pkgs.zsh;
    initialPassword = "changeMeNow";

    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
    ];

    autoSubUidGidRange = true;
  };

  services.openssh.settings.AllowUsers = [ "p0v0" ];

  security.doas.extraRules = [
    {
      users = [ "p0v0" ];
      noPass = true;
    }
  ];

  security.sudo.extraRules = [
    {
      users = [ "p0v0" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

  # Workaround for https://github.com/nix-community/home-manager/issues/322
  systemd.services.home-manager-p0v0 = {
    preStart = ''
      rm -f "$HOME/.ssh/config"
    '';

    postStart = ''
      cp --remove-destination "$(readlink -f "$HOME/.ssh/config")" "$HOME/.ssh/config"
    '';
  };

  # Connect Home Manager Configuration
  home-manager.users.p0v0 = import ./home/home.nix;
}
