{
  config,
  pkgs,
  inputs,
  ...
}: {
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;
  #services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [gnome-tour gnome-user-docs];

  # conflicts with it so disable
  services.gnome.gcr-ssh-agent.enable = false;

  environment.systemPackages = with pkgs.gnomeExtensions; [
    tiling-shell
    emoji-copy
    gsconnect
    caffeine
    clipboard-indicator
    appindicator
    power-off-options
    papirus-folders-colorizer
    blur-my-shell
    dash-to-dock
    burn-my-windows
    rounded-window-corners-reborn
    coverflow-alt-tab
  ];
}
