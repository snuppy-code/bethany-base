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

    swaybg
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
