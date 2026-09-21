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
    fuzzel

    nautilus

    engrampa
    file-roller
    peazip

    lite-xl

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
    xwayland-satellite
    clipse
    wl-clip-persist
    wl-clipboard
    swaybg
    jq
    wl-mirror
  ];

  # portals configured for nya already by programs.niri

  systemd.user.services.nya-clip-persist = {
    enable = true;
    path = [pkgs.wl-clip-persist];
    after = ["niri.service" "nyaclipboard-dir.service"];
    wantedBy = ["niri.service"];
    description = "Run wl-clip-persist to have copied data usable after closing window!";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.wl-clip-persist}/bin/wl-clip-persist --clipboard regular";
      Restart = "on-failure";
    };
  };

  systemd.user.services.nya-clipse = {
    enable = true;
    path = [pkgs.clipse];
    after = ["niri.service" "nyaclipboard-dir.service" "nyaclipboard-persist.service"];
    wantedBy = ["niri.service"];
    description = "Set up clipse!";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.clipse}/bin/clipse -listen-shell";
      RuntimeDirectory = "clipse clipse/imgs";
      RuntimeDirectoryPreserve = "restart";
      Restart = "on-failure";
    };
  };

  systemd.user.services.nya-swaybg = {
    enable = true;
    path = [pkgs.swaybg];
    after = ["niri.service"];
    wantedBy = ["niri.service"];
    description = "Set up background image!";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.swaybg}/bin/swaybg --image /etc/nixos/bethany-base/assets/wallpapers/minecraft/night-lookout.png -m fill";
      Restart = "on-failure";
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
