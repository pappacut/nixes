{
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "patrick";

    settings = {
      devices = {
        "pixel10" = {
          name = "Pixel 10 Pro XL";
          id = "LFANBT3-MUYNDTL-LZEBKEE-Y7RLJY6-D3ACPXY-73TVXN2-SARNRPW-CKODLQL";
        };
      };
      folders = {
        "keepass" = {
          id = "dizum-nfezd";
          path = "/home/patrick/syncthing/keepass";
          devices = [ "pixel10" ];
        };

        "keepass-work" = {
          id = "jqqq6-c9zap";
          path = "/home/patrick/syncthing/keepass-work";
          devices = [ "pixel10" ];
        };
      };
    };
  };
}
