{
  config,
  lib,
  pkgs,
  ...
}: {
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
}
