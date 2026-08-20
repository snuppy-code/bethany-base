{
  config,
  pkgs,
  inputs,
  ...
}: {
  stylix.targets = {
    # anki
    # bat
    # blender
    # btop
    # cava
    # discord
    # starship.enable = true;
    # lazygit.enable = true;
    zed.enable = true;
    # kitty.enable = true; # nuh, own theme
    # fish.enable = true; # nuh, own theme
    nvf.enable = true;
    firefox = {
      enable = true;
      profileNames = ["default"];
    };
    # fzf.enable = true;
    gnome-text-editor.enable = true;
    gnome.enable = true;
    gtk.enable = true;
    qt.enable = true;
    gtksourceview.enable = true;
    # mpv
    nixos-icons.enable = true;
    # spicetify
    # tmux
    # vscode
    # yazi
  };
}
