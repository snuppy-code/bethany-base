{
  config,
  pkgs,
  inputs,
  ...
}: {
  hardware.bluetooth.enable = true;
  services.smartd.enable = true; # SMART Daemon
  services.fstrim.enable = true; # important !
  networking.networkmanager.enable = true;
  hardware.enableRedistributableFirmware = true;
}
