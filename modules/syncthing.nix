{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  users.groups.petrova.gid = 2019; # for folders synced by syncthing (the files seen from a far as a petrova line of migrating astrophage !)

  users.users.petrova = {
    isSystemUser = true;
    description = "user for syncthing";
    uid = 2019;
    group = "petrova";
  };

  sops.secrets.syncthing-password = {
    owner = "petrova";
    group = "petrova";
    mode = "0400";
  };

  systemd.tmpfiles.rules = [
    "d /home/snuppy/Documents/ryland 2770 snuppy petrova - -"
    "d /home/snuppy/astrophage-vial 2770 snuppy petrova - -"
  ];

  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "petrova";
    group = "petrova";
    configDir = "/var/lib/syncthing";
    dataDir = "/var/lib/syncthing";
    guiAddress = "100.73.209.34:8384";
    overrideDevices = true;
    overrideFolders = true;
    guiPasswordFile = config.sops.secrets.syncthing-password.path;
    settings = {
      gui = {
        user = "petrova";
      };
      devices = {
        "lilin" = lib.mkIf (config.networking.hostName != "lilin") {
          autoAcceptFolders = false;
          id = "DSN4CJM-5BYN5A5-TRVYT34-OVKZRMR-AXVYMCI-OXEUS4D-Q7C5E7A-B356OA7";
          name = "lilin";
        };
        "tabris" = lib.mkIf (config.networking.hostName != "tabris") {
          autoAcceptFolders = false;
          id = "FGMRMX3-P5XAGRD-J6UNZ63-ESNAMMD-6RZBRA3-EWPVTPR-SC3TYCF-GKJ5TA3";
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
        "ryland" = {
          # label = "Cognition Assessment";
          id = "zme6w-vsdht";
          path = "/home/snuppy/Documents/ryland";
          devices = [
            "lilin"
          ];
          type = "sendreceive";
        };
        "astrophage-vial" = {
          # label = "Come watch the petrovascope :D";
          id = "udavy-lwfcd";
          path = "/home/snuppy/astrophage-vial";
          # remove tabris or lilin (?)?
          devices = lib.lists.remove config.networking.hostName [
            "lilin"
            "tabris"
            "eligius"
            "nakara"
          ];

          type = "sendreceive";
        };
      };
      options.urAccepted = 1;
    };
  };
  # https://www.freedesktop.org/software/systemd/man/latest/systemd.exec.html
  systemd.services.syncthing = {
    after = ["systemd-tmpfiles-setup.service"]; # urrgh stupid stupid game
    serviceConfig = {
      ProtectHome = "tmpfs";
      BindPaths = [
        "/home/snuppy/Documents/ryland"
        "/home/snuppy/astrophage-vial"
      ];
      ProtectSystem = "strict";
      ReadWritePaths = ["/var/lib/syncthing"];
      UMask = "0002";
    };
  };
}
