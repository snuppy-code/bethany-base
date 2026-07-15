{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    geteduroam
    #geteduroam-cli
  ];
}
