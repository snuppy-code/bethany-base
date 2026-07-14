{
  config,
  pkgs,
  inputs,
  ...
}: {
  security.sudo.extraConfig = "
    Defaults timestamp_timeout=0.25 # 0.25m, i.e. 15s
  ";
}
