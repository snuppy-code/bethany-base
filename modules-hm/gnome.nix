{
  config,
  pkgs,
  inputs,
  ...
}: {
  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-up = [];
      switch-to-workspace-down = [];
      move-to-workspace-up = [];
      move-to-workspace-down = [];
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };
}
