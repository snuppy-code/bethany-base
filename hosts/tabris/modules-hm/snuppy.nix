{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = [
    inputs.nix-citizen.packages.${pkgs.system}.rsi-launcher # rsi-launcher-git
    pkgs.jstest-gtk
  ];
}
