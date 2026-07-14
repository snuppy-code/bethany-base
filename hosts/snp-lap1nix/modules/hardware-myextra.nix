{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  system.stateVersion = "25.11";

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = ["kvm-intel"];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "snp-lap1nix";

  # https://wiki.nixos.org/wiki/Accelerated_Video_Playback
  # https://nixos.wiki/wiki/Intel_Graphics
  # https://wiki.nixos.org/wiki/Intel_Graphics
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-compute-runtime # for openCL, optional
      intel-media-driver
      vpl-gpu-rt
    ];
  };
  environment.sessionVariables = {LIBVA_DRIVER_NAME = "iHD";}; #unsure if this is right?

  # Wifi doesn't work after returning from sleep on nya's `Lenovo Yoga Pro 7 14IAH10`, more specifically it seems like nya has: `Intel(R) Wi-Fi 7 BE200 320MHz [Gale Peak]`
  # https://community.intel.com/t5/Wireless/Intel-WiFi-7-BE200-loses-connection-after-suspend-resume-on/m-p/1693403/highlight/true
  # Nya thinks the problem is with d3cold, so this just matches vendor and device (which should be unique to this chip and its variants?) that nya found with udevadm and lspci, and sets d3cold_allowed to "0"
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x8086", ATTR{device}=="0x272b", ATTR{d3cold_allowed}="0"
  '';
}
