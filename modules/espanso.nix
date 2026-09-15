{
  pkgs,
  inputs,
  ...
}: {
  services.espanso.enable = true;
  services.espanso.package = pkgs.espanso-wayland;
}
