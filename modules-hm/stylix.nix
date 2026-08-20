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
    kitty.enable = true;
    starship.enable = true;
    lazygit.enable = true;
    zed.enable = true;
    fish.enable = true;
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
