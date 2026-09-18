{
  config,
  pkgs,
  ...
}: let
  script = pkgs.writeText "script.py" (builtins.readFile ./niri-dynamic-windows.py);
in {
  systemd.user.services.niri-dynamic-float = {
    Unit = {
      After = ["niri.service"];
    };
    Service = {
      Type = "simple";
      ExecStart = "${pkgs.python3}/bin/python ${script}";
    };
    Install = {
      WantedBy = ["niri.service"];
    };
  };
}
