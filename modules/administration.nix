{ lib, ... }:
{
  services.openssh = {
    enable = true;
    openFirewall = true;
    settings = {
      PasswordAuthentication = lib.mkDefault false;
      KbdInteractiveAuthentication = lib.mkDefault true;
      PermitRootLogin = lib.mkDefault "prohibit-password";
    };
  };

  # rules are defined in user modules
  security.doas.enable = true;
  security.sudo.enable = true;
}
