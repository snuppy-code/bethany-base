{
  pkgs,
  inputs,
  ...
}: {
  stylix.enable = true;
  stylix.autoEnable = true;
  stylix.image = ../assets/wallpapers/mountains/a_snowy_mountain_with_dark_clouds.jpg;
  stylix.polarity = "dark";
  stylix.fonts = {
    monospace = {
      package = pkgs.nerd-fonts._0xproto;
      name = "0xProto Nerd Font";
    };
  };

  # https://github.com/tinted-theming/schemes
  # https://tinted-theming.github.io/tinted-gallery/
  # ---
  # snuppy favorites :D
  ## dark
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/ashes.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-medium.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/ocean.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/sandcastle.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/twilight.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/vulcan.yaml";
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/yesterday-night.yaml";
}
