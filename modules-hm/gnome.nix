{
  config,
  pkgs,
  inputs,
  ...
}: let
in {
  # dconf list /org/gnome/shell/extensions/
  # dconf dump /org/gnome/shell/extensions/
  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-up = [];
      switch-to-workspace-down = [];
      move-to-workspace-up = [];
      move-to-workspace-down = [];
    };
  };
}
