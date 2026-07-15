{
  config,
  lib,
  pkgs,
  ...
}: {
  system.stateVersion = "25.11";
  networking.hostName = "tabris";
  networking.hostId = "7d1d9835";
  boot.kernelModules = ["kvm-amd"];
}
