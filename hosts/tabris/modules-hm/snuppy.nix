{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = [
    pkgs.jstest-gtk
  ];
}
