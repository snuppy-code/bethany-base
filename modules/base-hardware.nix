{
  config,
  pkgs,
  inputs,
  ...
}: {
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  hardware.enableRedistributableFirmware = true;
  hardware.bluetooth.enable = true;
  services.smartd.enable = true; # SMART Daemon
  services.fstrim.enable = true; # important !
  networking.networkmanager.enable = true;
}
