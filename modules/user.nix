{
  pkgs,
  inputs,
  ...
}:
{
  services.userborn.enable = true;
  users.mutableUsers = false;

  users.users.patrick = {
    isNormalUser = true;
    shell = pkgs.zsh;
    initialPassword = "changeMeNow";
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
    ];
  };

  services.openssh.settings.AllowUsers = [ "patrick" ];

  security.doas.extraRules = [
    {
      users = [ "patrick" ];
      noPass = true;
    }
  ];

  security.sudo.extraRules = [
    {
      users = [ "patrick" ];
      commands = [
        {
          command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];

  # Connect Home Manager Configuration
  home-manager.users.patrick = import ./home.nix;
}
