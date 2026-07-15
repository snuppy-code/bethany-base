{
  pkgs,
  inputs,
  config,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = true;
    image = ../assets/wallpapers/mountains/a_snowy_mountain_with_dark_clouds.jpg;
    polarity = "dark";

    # https://github.com/tinted-theming/schemes
    # https://tinted-theming.github.io/tinted-gallery/
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/ashes.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/everforest-dark-medium.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/ocean.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/sandcastle.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/twilight.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/vulcan.yaml";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/yesterday-night.yaml";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 25;
    };
    # https://github.com/vinceliuice/Qogir-icon-theme          qogir-icon-theme
    # https://github.com/yeyushengfan258/Reversal-icon-theme   reversal-icon-theme
    # https://github.com/PapirusDevelopmentTeam/papirus_icons  papirus-icon-theme
    # https://github.com/Adapta-Projects/Papirus-Nord          papirus-nord
    # https://github.com/madmaxms/iconpack-obsidian            iconpack-obsidian
    # https://github.com/vinceliuice/Fluent-icon-theme         fluent-icon-theme
    iconTheme = {
      enable = true;
      # package = pkgs.papirus-icon-theme;
      # dark = "Papirus-Dark";
      package = pkgs.fluent-icon-theme;
      dark = "Fluent-dark";
      light = "Fluent";
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts._0xproto;
        name = "0xProto Nerd Font";
      };
    };
  };
}
