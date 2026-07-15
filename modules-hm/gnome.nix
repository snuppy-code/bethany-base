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
    "org/gnome/shell" = {
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "caffeine@patapon.info"
        "clipboard-indicator@tudmotu.com"
        "emoji-copy@felipeftn"
        "gsconnect@andyholmes.github.io"
        "power-off-options@axelitama.github.io"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "dash-to-dock@micxgx.gmail.com"
        "tilingshell@ferrarodomenico.com"
        "burn-my-windows@schneegans.github.com"
        "blur-my-shell@aunetx"
      ];
      favorite-apps = [
        "firefox.desktop"
        "discord.desktop"
        "spotify.desktop"
        "dev.zed.Zed.desktop"
        "thunar.desktop"
        "io.github.Qalculate.qalculate-qt.desktop"
        "org.gnome.Nautilus.desktop"
      ];
    };
  };
}
