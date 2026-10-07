{
  pkgs,
  inputs,
  ...
}: {
  services.espanso.enable = true;
  services.espanso.package = pkgs.espanso-wayland;
  systemd.user.services.espanso.path = [pkgs.python3];
}
