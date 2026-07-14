{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    libGL
    #xorg.libX11
    #xorg.libXext
    #xorg.libXrender
    #glib
    #alsa-lib
    #fontconfig
    #freetype
    #zlib
  ];
}
