{
  config,
  pkgs,
  ...
}: let
  script = pkgs.writeText "script.py" (builtins.readFile ./niri-dynamic-windows.py);
in {
  systemd.user.services.niri-dynamic-float = {
    after = ["niri.service"];
    script = "${pkgs.python3}/bin/python ${script}";
    wantedBy = ["niri.service"];
  };
}
