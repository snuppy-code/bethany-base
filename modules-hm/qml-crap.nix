{
  config,
  pkgs,
  inputs,
  ...
}: {
  services.qml-crap-lock = {
    enable = true;
    wallpaper = "/etc/nixos/bethany-base/assets/wallpapers/minecraft/tree-sunset.png";
    avatar = "/etc/nixos/bethany-base/assets/avatar/pfp_maki.png";
    displayName = "Frøya";
    idle.timeout = 300;
    unlockUnits = ["nya-restart-espanso.service"];
  };
}
