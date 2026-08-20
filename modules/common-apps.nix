{
  config,
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs;
    [
      lazygit
      packwiz
      fresh-editor

      readest
      cozy
      kitty
      prusa-slicer
      yubioath-flutter
      resources
      gnome-system-monitor
      gnome-font-viewer
      gnome-clocks
      qbittorrent
      godsvg
      firefox
      (discord.override {
        withVencord = true;
      })
      gajim
      element-desktop
      typst
      proton-vpn
      normcap
      anki
      libreoffice-still # should be gtk
      obsidian
      nextcloud-client
      solaar
      qalculate-qt
      spotify
      vlc
      mpv
      ffmpeg
      easyeffects
      pavucontrol
      krita
      aseprite
      blender
      obs-studio
      audacity
      # freecad

      protonplus

      (prismlauncher.override {
        jdks = [
          jdk8
          jdk17
          jdk21
          jdk25
        ];
      })
      lutris
      bottles

      gnome-boxes
      gparted
      veracrypt
      processing
      github-desktop
    ]
    ++ [
      inputs.helium.packages.${pkgs.system}.default
      inputs.slon.packages.${pkgs.system}.default
    ];
}
