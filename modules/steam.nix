{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = false; # not using !
    dedicatedServer.openFirewall = false; # not running one !
    localNetworkGameTransfers.openFirewall = true;
  };
}
