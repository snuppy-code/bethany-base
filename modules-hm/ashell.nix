{
  config,
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}: {
  programs.ashell.enable = true;
  programs.ashell.systemd.enable = true;
  programs.ashell.package = pkgs-unstable.ashell;
}
