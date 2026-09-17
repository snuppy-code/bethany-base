{
  config,
  pkgs,
  inputs,
  ...
}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${config.programs.niri.package}/bin/niri-session";
        user = "snuppy";
      };
    };
  };
  programs.niri.enable = true;

  security.polkit.enable = true; # polkit
  services.gnome.gnome-keyring.enable = true; # secret service, explicitly enable
  security.pam.services.swaylock = {};
  programs.waybar.enable = true; # top bar
  environment.systemPackages = with pkgs; [
    fuzzel
    swaylock
    nautilus
    mako
    swayidle
    xwayland-satellite
  ];

  # portals configured for nya already by the thingamajig

  # NixOS otherwise injects a stripped PATH via Environment= on the niri.service
  # unit which shadows the imported user-manager PATH. Disabling the default
  # lets niri inherit the full PATH set up by niri-session.
  systemd.user.services.niri.enableDefaultPath = false;
}
