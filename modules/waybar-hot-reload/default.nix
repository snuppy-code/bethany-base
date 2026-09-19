{
  config,
  pkgs,
  lib,
  ...
}: let
  waybar-hot-reload = pkgs.writeShellApplication {
    name = "waybar-hot-reload";
    runtimeInputs = [pkgs.inotify-tools pkgs.waybar];
    text = builtins.readFile ./waybar-hot-reload;
  };
in {
  systemd.user.services.waybar-hot-reload = {
    after = ["niri.service"];
    wantedBy = ["niri.service"];
    serviceConfig = {
      ExecStart = lib.getExe waybar-hot-reload;
      Restart = "on-failure";
    };
  };
}
