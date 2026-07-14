{
  config,
  pkgs,
  inputs,
  ...
}: {
  services.syncthing = {
    enable = true;
    openDefaultPorts = false;
  };
  networking.firewall.allowedTCPPorts = [
    22000 # syncthing
  ];
  networking.firewall.allowedUDPPorts = [
    22000 # syncthing
    21027 # syncthing
  ];

  environment.systemPackages = with pkgs; [
    syncthing # gui opener (?)
  ];
}
