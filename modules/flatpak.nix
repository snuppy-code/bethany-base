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
    "com.super_productivity.SuperProductivity"
  ];

  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "*-*-* 7:00:00"; # 7am
  };
}
