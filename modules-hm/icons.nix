{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: let
  fluent-papirus-nord = pkgs.fluent-fluent-icon-theme.overrideAttrs (
    finalAttrs: previousAttrs: {
    }
  );
in {
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.qogir-icon-theme;
      name = "Qogir";
    };
    # some of the icon packs I like or find funny
    # https://github.com/vinceliuice/Qogir-icon-theme          qogir-icon-theme
    # https://github.com/yeyushengfan258/Reversal-icon-theme   reversal-icon-theme
    # https://github.com/PapirusDevelopmentTeam/papirus_icons  papirus-icon-theme
    # https://github.com/Adapta-Projects/Papirus-Nord          papirus-nord
    # https://github.com/madmaxms/iconpack-obsidian            iconpack-obsidian
    # https://github.com/vinceliuice/Fluent-icon-theme         fluent-icon-theme
    # couldn't find in nixpkgs:
    # https://github.com/cbrnix/Newaita
    # https://github.com/RusticBard/Neuwaita
    # https://github.com/zayronxio/Deepin-icons-2022
    iconTheme = {
      package = pkgs.fluent-icon-theme;
      name = "Fluent Dark";
    };
  };
}
