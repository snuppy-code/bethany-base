{
  pkgs,
  inputs,
  config,
  ...
}: {
  stylix = {
    enable = true;
    autoEnable = false;
    image = ../assets/wallpapers/mountains/a_snowy_mountain_with_dark_clouds.jpg;
    polarity = "dark";

    # https://github.com/tinted-theming/schemes
    # https://tinted-theming.github.io/tinted-gallery/
    # dark:
    # - ashes
    # - everforest-dark-medium
    # - kanagawa
    # - ocean
    # - nord
    # - sandcastle
    # - twilight
    # - vulcan
    base16Scheme = "${pkgs.base16-schemes}/share/themes/yesterday-night.yaml";
    # light:
    # - atelier-plateau-light
    # - sagelight
    # - classic-light
    # - brush-trees
    # - material-lighter
    # - nord-light
    # - penumbra-light
    # - cupcake
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

    targets = {
      # anki
      # bat
      # blender
      # btop
      # cava
      # discord
      # kitty.enable = true;
      # lazygit.enable = true;
      nvf.enable = true;
      # firefox.enable = true;
      # fzf.enable = true;
      gnome-text-editor.enable = true;
      gnome.enable = true;
      gtk.enable = true;
      qt.enable = true;
      gtksourceview.enable = true;
      nixos-icons.enable = true;
      # fish
      # mpv
      # Obsidian
      # spicetify
      # starship
      # tmux
      # vscode
      # yazi
      # zed
    };
  };
}
