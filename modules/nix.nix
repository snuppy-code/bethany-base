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
    "d /etc/nixos/ 2775 root nerv-staff -"
    "d /etc/nixos/bethany-base 2775 snuppy users -"
    "d /etc/nixos/terminal-dogma 2775 root nerv-staff -"
    "A /etc/nixos/terminal-dogma - - - - g:nerv-staff:rwx,d:g:nerv-staff:rwx,o::r" # x on ALL FILES is not great but nya can't see a way to do it without `setfacl` so the alternative is prob a systemd oneshot
  ];

  systemd.user.services.setPermsOn = {
    enable = true;
    after = ["network.target"];
    wantedBy = ["default.target"];
    description = "My Cool User Service";
    serviceConfig = {
      Type = "simple";
      ExecStart = ''/my/cool/user/service'';
    };
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 14d --keep 10";
    flake = "/etc/nixos/bethany-base";
  };
}
