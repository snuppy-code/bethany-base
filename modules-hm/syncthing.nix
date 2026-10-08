{
  config,
  pkgs,
  inputs,
  lib,
  nixosConfig,
  ...
}: {
  sops.secrets.syncthing-password = {
    path = "${config.sops.defaultSymlinkPath}/syncthing-password";
  };

  services.syncthing = {
    enable = true;
    guiAddress = "0.0.0.0:8384";
    overrideDevices = true;
    overrideFolders = true;
    guiCredentials = {
      passwordFile = config.sops.secrets.syncthing-password.path;
      username = "snuppy";
    };
    settings = {
      devices = {
        # don't create this entry if we are this device
        "lilin" = lib.mkIf (nixosConfig.networking.hostName != "lilin") {
          autoAcceptFolders = false;
          id = "XVUBQ3S-EE4I3UX-HVDP4HP-CZC55YD-QZJKZHT-EDIUKAD-ZCAYTPE-V42YLQD";
          name = "lilin";
        };
        # don't create this entry if we are this device
        "tabris" = lib.mkIf (nixosConfig.networking.hostName != "tabris") {
          autoAcceptFolders = false;
          id = "VZMXBRN-KYPOEO6-YX56SXL-EMN7HHR-62ND6CU-CHYAOLB-G5XS3RI-R3PZCQU";
          name = "tabris";
        };
        "eligius" = {
          autoAcceptFolders = false;
          id = "66UOSXT-RPU6FFZ-KJ7FN76-567D3B6-AJ2FXU3-7HKV46J-FW555KZ-M6XXRQ5";
          name = "eligius";
        };
        "bardo" = {
          autoAcceptFolders = false;
          id = "Z2RAULU-AQIHH2U-3IS3F2C-HMSNBSQ-ZVZFUXA-IER7UET-MSNLYPN-LBOPRAE";
          name = "bardo";
        };
        "nakara" = {
          autoAcceptFolders = false;
          id = "MJEMDQ4-P7234HZ-QKQ4GBV-GNMYEUR-FTXLORT-EGGVELB-TAEIYCV-JX2BRAG";
          name = "nakara";
        };
      };
      folders = {
        "sol" = {
          enable = true;
          # personal files
          id = "nerjd-lbvyj";
          path = "/home/snuppy/sync/sol/";
          ignorePerms = true;
          ignorePatterns = [
            "workspace.json"
            "workspace-mobile.json"
            "community-plugins.json"
            "appearance.json"
          ];
          devices = lib.lists.remove nixosConfig.networking.hostName [
            "lilin"
            "tabris"
          ];
          type = "sendreceive";
        };
        "eri" = {
          enable = true;
          # shared with bunni
          id = "7uig4-rufph";
          path = "/home/snuppy/sync/eri/";
          ignorePerms = true;
          ignorePatterns = [
            "workspace.json"
            "workspace-mobile.json"
            "community-plugins.json"
            "appearance.json"
          ];
          devices = lib.lists.remove nixosConfig.networking.hostName [
            "lilin"
            "tabris"
            "eligius"
            "nakara"
            "bardo"
          ];
          type = "sendreceive";
        };
      };
      options.urAccepted = -1;
    };
  };
}
