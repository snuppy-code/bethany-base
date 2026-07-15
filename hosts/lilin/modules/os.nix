{
  config,
  lib,
  pkgs,
  ...
}: {
  system.stateVersion = "25.11";
  networking.hostName = "lilin";
  boot.kernelModules = ["kvm-intel"];

  # Wifi doesn't work after returning from sleep on nya's `Lenovo Yoga Pro 7 14IAH10`, more specifically it seems like nya has: `Intel(R) Wi-Fi 7 BE200 320MHz [Gale Peak]`
  # https://community.intel.com/t5/Wireless/Intel-WiFi-7-BE200-loses-connection-after-suspend-resume-on/m-p/1693403/highlight/true
  # Nya thinks the problem is with d3cold, so this just matches add events on vendor and device (which should be unique to this chip and its variants?) that nya found with udevadm and lspci, and sets d3cold_allowed to "0"
  # Nya thinks it might be smart to match on additional ACTIONs but nya is not sure which ones, and `change` made the laptop constantly wake up from suspend so nya removed it.
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x8086", ATTR{device}=="0x272b", ATTR{d3cold_allowed}="0"
  '';
}
