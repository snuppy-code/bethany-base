{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.steam = {
    enable = true;
    extraCompatPackages = [
      pkgs.proton-ge-bin
    ];
    localNetworkGameTransfers.openFirewall = true; # using <3
    remotePlay.openFirewall = false; # not using !
    dedicatedServer.openFirewall = false; # not running one !!
  };
}
