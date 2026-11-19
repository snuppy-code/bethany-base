{
  config,
  pkgs,
  inputs,
  ...
}: {
  services.flatpak.enable = true;

  services.flatpak.packages = [
    "com.modrinth.ModrinthApp"
    "org.deskflow.deskflow"
    "app.zen_browser.zen"
  ];

  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "*-*-* 7:00:00"; # 7am
  };
}
