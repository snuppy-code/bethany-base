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
}
