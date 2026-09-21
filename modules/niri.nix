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

  systemd.user.services.nyaclipboard-dir = let
    program = pkgs.writeShellApplication {
      name = "nyaclipboard-dir";
      text = ''
        mkdir -p "$XDG_RUNTIME_DIR"/clipse/imgs/
      '';
    };
  in {
    enable = true;
    after = ["niri.service"];
    wantedBy = ["niri.service"];
    description = "Create temporary directory for clipboard history!";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = lib.getExe program;
      Restart = "on-failure";
    };
  };

  systemd.user.services.nyaclipboard-persist = let
    program = pkgs.writeShellApplication {
      name = "nyaclipboard-persist";
      runtimeInputs = [pkgs.wl-clip-persist];
      text = ''
        wl-clip-persist --clipboard regular
      '';
    };
  in {
    enable = true;
    after = ["niri.service" "nyaclipboard-dir.service"];
    wantedBy = ["niri.service"];
    description = "Run wl-clip-persist to have copied data usable after closing window!";
    serviceConfig = {
      Type = "simple";
      ExecStart = lib.getExe program;
      Restart = "on-failure";
    };
  };

  systemd.user.services.nyaclipboard-clipse = let
    program = pkgs.writeShellApplication {
      name = "nyaclipboard-clipse";
      runtimeInputs = [pkgs.clipse];
      text = ''
        clipse -listen
      '';
    };
  in {
    enable = true;
    after = ["niri.service" "nyaclipboard-dir.service" "nyaclipboard-persist.service"];
    wantedBy = ["niri.service"];
    description = "Set up clipse!";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = lib.getExe program;
      Restart = "on-failure";
    };
  };
  systemd.user.services.nya-swaybg = let
    program = pkgs.writeShellApplication {
      name = "nya-swaybg";
      runtimeInputs = [pkgs.swaybg];
      text = ''
        swaybg --image /etc/nixos/bethany-base/assets/wallpapers/minecraft/night-lookout.png -m fill
      '';
    };
  in {
    enable = true;
    after = ["niri.service"];
    wantedBy = ["niri.service"];
    description = "Set up background image!";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = lib.getExe program;
      Restart = "on-failure";
    };
  };
  # spawn-sh-at-startup "mkdir -p $XDG_RUNTIME_DIR/clipse/imgs/"
  # spawn-at-startup "ashell"
  # spawn-at-startup "swaybg" "--image" "/etc/nixos/bethany-base/assets/wallpapers/minecraft/night-lookout.png" "-m" "fill"
  # spawn-at-startup "wl-clip-persist" "--clipboard" "regular"
  # spawn-at-startup "clipse" "-listen"

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
