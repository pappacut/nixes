{
  services.syncthing = {
    enable = false;
    openDefaultPorts = true;
    user = "patrick";

    settings = {
      devices = {
        "pixel10" = {
          name = "Pixel 10 Pro XL";
          id = "";
        };
      };
      folders = {
        "keepass" = {
          id = "";
          path = "/home/patrick/syncthing/keepass";
          devices = [ "pixel10" ];
        };

        "keepass-work" = {
          id = "";
          path = "/home/patrick/syncthing/keepass-work";
          devices = [ "pixel10" ];
        };
      };
    };
  };
}
