{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  programs.niri.enable = true;

  services.upower.enable = true;

  security.polkit.enable = true; # polkit
  services.gnome.gnome-keyring.enable = true; # secret service, explicitly enable
  environment.systemPackages = with pkgs; [
    nautilus

    engrampa
    file-roller
    peazip

    pragtical

    oculante
    # loupe # oculante is fine and has extra cool stuff

    mpv
    showtime
    # celluloid # had a terrible experience
    # clapper # had an awful experience

    newsflash

    # euphonica # didnt wanna load everything, no idea why, can't be arsed
    amberol
    blanket
    decibels

    overskride

    dunst
    brightnessctl
    playerctl
    fuzzel
    xwayland-satellite
    cliphist
    wl-clipboard
    jq
    wl-mirror
  ];

  # portals configured for nya already by programs.niri

  systemd.user.services.nya-clip-persist = {
    after = ["niri.service"];
    partOf = ["niri.service"];
    wantedBy = ["niri.service"];
    description = "Run wl-clip-persist to have copied data usable after closing window!";
    serviceConfig = {
      ExecStart = "${pkgs.wl-clip-persist}/bin/wl-clip-persist --clipboard regular";
      Restart = "on-failure";
    };
  };

  systemd.user.services.nya-cliphist = {
    after = ["niri.service"];
    partOf = ["niri.service"];
    wantedBy = ["niri.service"];
    serviceConfig = {
      ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --watch ${pkgs.cliphist}/bin/cliphist -db-path %t/cliphist/db store";
      RuntimeDirectory = "cliphist";
      RuntimeDirectoryPreserve = "restart";
      Restart = "on-failure";
    };
  };

  systemd.user.services.nya-swaybg = {
    after = ["niri.service"];
    partOf = ["niri.service"];
    wantedBy = ["niri.service"];
    description = "gives nya wallpapers";
    serviceConfig = {
      ExecStart = "${pkgs.swaybg}/bin/swaybg --image /etc/nixos/bethany-base/assets/wallpapers/minecraft/night-lookout.png -m fill";
      Restart = "on-failure";
    };
  };

  systemd.user.services.nya-restart-espanso = {
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.systemd}/bin/systemctl --user restart espanso.service";
    };
  };
  services.qml-crap = {
    lock.enable = true;
    greeter = {
      enable = true;
      loginUser = "snuppy";
      displayName = "Frøya";
      wallpaper = ../assets/wallpapers/minecraft/tree-sunset.png;
      avatar = ../assets/avatar/pfp_maki.png;
      kanshi.configFile = ../stow/kanshi/.config/kanshi/config;
      keyboard.layout = "us";
    };
  };

  # NixOS otherwise injects a stripped PATH via Environment= on the niri.service
  # unit which shadows the imported user-manager PATH. Disabling the default
  # lets niri inherit the full PATH set up by niri-session.
  systemd.user.services.niri.enableDefaultPath = false;
}
