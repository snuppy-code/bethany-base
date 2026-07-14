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

  environment.systemPackages = with pkgs; [
    gnomeExtensions.tiling-shell
    gnomeExtensions.emoji-copy
    gnomeExtensions.gsconnect
    gnomeExtensions.caffeine
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.appindicator
    gnomeExtensions.power-off-options
    gnomeExtensions.papirus-folders-colorizer
  ];
}
