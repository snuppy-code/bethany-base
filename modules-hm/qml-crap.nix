{
  config,
  pkgs,
  inputs,
  ...
}: {
  services.qmp-crap-lock = {
    enable = true;
    wallpaper = "/etc/nixos/bethany-base/assets/wallpapers/minecraft/tree-sunset.png";
    avatar = "/etc/nixos/bethany-base/assets/avatar/pfp_maki.png";
    displayName = "Frøya";
    idle.timeout = 300;
  };
}
