{
  config,
  inputs,
}: {
  imports = [
    ../../modules/sops.nix
    ../../modules/base-hardware.nix
    ../../modules/virtualization.nix
    ../../modules/regional.nix
    ../../modules/audio.nix
    ../../modules/security.nix
    ../../modules/exposed.nix
    ../../modules/nuphy.nix
    ../../modules/minecraft.nix
    ../../modules/ssh.nix
    ../../modules/tailscale.nix
    # ../../modules/syncthing.nix
    ../../modules/kde-connect.nix
    ../../modules/soulseek.nix
    ../../modules/git-systemwide.nix
    ../../modules/nix.nix
    ../../modules/users.nix
    ../../modules/cli.nix
    ../../modules/nvf.nix
    ../../modules/common-apps.nix
    ../../modules/espanso.nix
    # ../../modules/thunar.nix
    ../../modules/steam.nix
    ../../modules/ld.nix
    ../../modules/flatpak.nix
    ../../modules/fonts.nix
    ../../modules/stylix.nix
    ../../modules/home-manager.nix
    {
      home-manager.users.snuppy = {
        imports = [
          inputs.sops-nix.homeManagerModule
          ../../modules-hm/home-manager.nix
          ../../modules-hm/stylix.nix
          ../../modules-hm/common-apps.nix
          ../../modules-hm/virtualization.nix
        ];
      };
    }
  ];
}
