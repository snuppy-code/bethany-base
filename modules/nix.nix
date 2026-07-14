{
  config,
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-users = [
      "root"
      "snuppy"
    ];
  };

  systemd.tmpfiles.rules = [
    "d /etc/nixos 2775 root nerv-staff -"
    "A /etc/nixos - - - - g:nerv-staff:rwx,d:g:nerv-staff:rwx" # x on FILES is not great but nya can't see a way to do it without `setfacl` so the alternative is prob a systemd oneshot
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 14d --keep 10";
    flake = "/etc/nixos/bethany-base";
  };
}
