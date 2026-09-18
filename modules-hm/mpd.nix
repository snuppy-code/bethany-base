{
  config,
  pkgs,
  inputs,
  ...
}: {
  services.mpd = {
    enable = true;
    musicDirectory = "/home/snuppy/Music";
  };
  services.mpd-mpris.enable = true;
  services.mpd-discord-rpc.enable = true;
}
