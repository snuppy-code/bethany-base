{
  config,
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs;
    [
      inputs.helium.packages.${pkgs.system}.default
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
      signal-desktop
      typst
      proton-vpn
      normcap
      anki
      obsidian
      nextcloud-client
      solaar
      qalculate-qt
      spotify
      vlc
      mpv
      ffmpeg
      # easyeffects
      # pavucontrol
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
      zed-editor
    ]
    ++ [
      inputs.finnjobtool.packages.${pkgs.system}.default
      inputs.finnjobtool.packages.${pkgs.system}.cli
    ];
}
