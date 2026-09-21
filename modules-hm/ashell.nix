{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.ashell.enable = true;
  programs.ashell.systemd.enable = true;
}
