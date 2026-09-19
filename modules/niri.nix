{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.niri.enable = true;

  services.upower.enable = true;

  security.polkit.enable = true; # polkit
  services.gnome.gnome-keyring.enable = true; # secret service, explicitly enable
  environment.systemPackages = with pkgs; [
    (inputs.pixie-sddm.packages.${pkgs.stdenv.hostPlatform.system}.pixie-sddm.override {
      background = ../assets/wallpapers/minecraft/tree-sunset.png;
      avatar = ../assets/avatar/pfp_maki.png;
      # accentColor = "#3F5F91"; # Hex color code
      autoColor = true; # true/false
      # backgroundColor = "#1A1C1E"; # Hex color code
      # textColor = "#E2E2E6"; # Hex color code
      fontFamily = "Jetbrains Mono";
      # fontFamily = "0xProto Nerd Font";
    })

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

    mako
    xwayland-satellite

    ashell
    # kanshi
    jq
    wl-mirror
  ];

  # portals configured for nya already by programs.niri

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
