{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  # The syncthing perms and security is as follows:
  # Synced folders go in /srv/, syncthing runs as petrova:petrova, and has access only
  # to the few paths it needs. This does not include e.g. user homes. It has umask 007
  # and so creates with rw-rw----, drwxrwx---.
  # Nya's user has its own group (snuppy:snuppy), and is also in petrova group.
  # petrova user is also in `snuppy` group.
  # Nya's user has umask 007 and so creates with rw-rw----, drwxrwx---.

  users.groups.petrova.gid = 2019; # year of petrova line discovery

  users.users.petrova = {
    isSystemUser = true;
    description = "user for syncthing";
    uid = 2019;
    group = "petrova";
    extraGroups = ["snuppy"]; # seems scary ! but systemd serviceConfig hides all but what it needs so it should be good ! (add other users to this list)
  };

  sops.secrets.syncthing-password = {
    owner = "petrova";
    group = "petrova";
    mode = "400";
  };

  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "petrova";
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
          path = "/srv/sol/";
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
          path = "/srv/eri/";
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
      ProtectHome = true;
      ProtectSystem = "strict";
      ReadWritePaths = [
        "/var/lib/syncthing"
        "/srv/sol"
        "/srv/eri"
      ];
      UMask = "007";
    };
  };
}
