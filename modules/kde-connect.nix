{
  config,
  pkgs,
  inputs,
  ...
}: {
  # https://userbase.kde.org/KDEConnect#:~:text=can%27t%20see%20each%20other
  networking.firewall.allowedTCPPortRanges = [
    {
      from = 1714;
      to = 1764;
    }
  ];
  networking.firewall.allowedUDPPortRanges = [
    {
      from = 1714;
      to = 1764;
    }
  ];
}
