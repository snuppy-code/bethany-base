{
  config,
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    nicotine-plus
  ];
  networking.firewall.allowedTCPPorts = [2234];
}
