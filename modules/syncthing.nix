{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  # Nya has reconcluded that running syncthing as its own user is not possible without having to constantly chmod stuff during usage,
  #  so nya will be running it as nyas user.
  # The problem is that while nya can add nyaself to syncthing's group, and syncthing to nya's group,
  #  and change the syncthing service's umask and nya's own umask so nya only ever creates files that are rw for group (so syncthing can read it),
  #  some programs will just straight up ignore this (chmod their files after the fact) or complain if group has rw,
  #  so nya will inevitably have to chmod stuff to fix sync issues in the future, and nya can't be arsed.
  #  the level of isolation you can get by setting options in serviceConfig should be good enough

  sops.secrets.syncthing-password = {
    owner = "snuppy";
    group = "root";
    mode = "400";
  };

  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "snuppy";
    group = "snuppy";
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
        user = "petrova";
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
          path = "/home/snuppy/sync/sol/";
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
          path = "/home/snuppy/sync/eri/";
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
    serviceConfig = {
      ProtectHome = "tmpfs";
      BindPaths = [
        "/home/snuppy/sync/sol"
        "/home/snuppy/sync/eri"
      ];
      ProtectSystem = "strict";
      ReadWritePaths = [
        "/var/lib/syncthing"
      ];
      UMask = "007";
    };
  };
}
