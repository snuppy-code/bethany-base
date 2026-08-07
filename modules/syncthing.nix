{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  users.groups.petrova.gid = 2019;

  sops.secrets.syncthing-password = {
    owner = "snuppy";
    group = "root";
    mode = "400";
  };

  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "snuppy";
    group = "petrova";
    guiAddress =
      {
        lilin = "100.74.91.73:8384";
        tabris = "100.73.209.34:8384";
      }."${config.networking.hostName}" or "127.0.0.1:8384";
    overrideDevices = true;
    overrideFolders = true;
    guiPasswordFile = config.sops.secrets.syncthing-password.path;
    settings = {
      gui = {
        user = "snuppy";
      };
      devices = {
        # don't create this entry if we are this device
        "lilin" = lib.mkIf (config.networking.hostName != "lilin") {
          autoAcceptFolders = false;
          id = "OVGAC56-JAINDBQ-22XQHV3-JZKGERO-BDWNAYJ-P2EBMJN-AHJTUDT-5D54DQK";
          name = "lilin";
        };
        # don't create this entry if we are this device
        "tabris" = lib.mkIf (config.networking.hostName != "tabris") {
          autoAcceptFolders = false;
          id = "RCNYKWR-ANNRYMQ-5AEAQTM-VJX327K-HV5N353-HOSCL6P-WSGO7KM-FV4OQA5";
          name = "tabris";
        };
        "eligius" = {
          autoAcceptFolders = false;
          id = "66UOSXT-RPU6FFZ-KJ7FN76-567D3B6-AJ2FXU3-7HKV46J-FW555KZ-M6XXRQ5";
          name = "eligius";
        };
        "nakara" = {
          autoAcceptFolders = false;
          id = "MJEMDQ4-P7234HZ-QKQ4GBV-GNMYEUR-FTXLORT-EGGVELB-TAEIYCV-JX2BRAG";
          name = "nakara";
        };
      };
      folders = {
        "sol" = {
          # personal files
          id = "nerjd-lbvyj";
          path = "/home/snuppy/sol/";
          ignorePerms = true;
          ignorePatterns = [
            "workspace.json"
            "workspace-mobile.json"
            "community-plugins.json"
            "appearance.json"
          ];
          devices = lib.lists.remove config.networking.hostName [
            "lilin"
            "tabris"
          ];
          type = "sendreceive";
        };
        "eri" = {
          # shared with bunni
          id = "7uig4-rufph";
          path = "/home/snuppy/eri/";
          ignorePerms = true;
          ignorePatterns = [
            "workspace.json"
            "workspace-mobile.json"
            "community-plugins.json"
            "appearance.json"
          ];
          devices = lib.lists.remove config.networking.hostName [
            "lilin"
            "tabris"
            "eligius"
            "nakara"
          ];
          type = "sendreceive";
        };
      };
      options.urAccepted = -1;
    };
  };
  # https://www.freedesktop.org/software/systemd/man/latest/systemd.exec.html
  systemd.services.syncthing = {
    after = ["systemd-tmpfiles-setup.service"];
    serviceConfig = {
      ProtectHome = "tmpfs";
      BindPaths = [
        "/home/snuppy/sol/"
        "/home/snuppy/eri/"
      ];
      ProtectSystem = "strict";
      ReadWritePaths = [
        "/var/lib/syncthing"
      ];
    };
  };
}
