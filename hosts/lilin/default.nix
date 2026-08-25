{
  config,
  inputs,
  ...
}: {
  imports = [
    ./modules/hardware-configuration.nix
    ./modules/os.nix
    ./modules/gpu.nix
    ./modules/throttle.nix
    inputs.sops-nix.nixosModules.sops
    inputs.nvf.nixosModules.default
    inputs.stylix.nixosModules.stylix
    inputs.home-manager.nixosModules.home-manager
    inputs.nix-flatpak.nixosModules.nix-flatpak
    ../../modules/sops.nix
    ../../modules/base-hardware.nix
    ../../modules/gnome.nix
    ../../modules/virtualization.nix
    ../../modules/regional.nix
    ../../modules/audio.nix
    ../../modules/security.nix
    ../../modules/exposed.nix
    ../../modules/ssh.nix
    ../../modules/tailscale.nix
    # ../../modules/syncthing.nix
    ../../modules/kde-connect.nix
    ../../modules/git-systemwide.nix
    ../../modules/nix.nix
    ../../modules/users.nix
    ../../modules/cli.nix
    ../../modules/nvf.nix
    ../../modules/common-apps.nix
    ../../modules/thunar.nix
    ../../modules/steam.nix
    ../../modules/ld.nix
    ../../modules/flatpak.nix
    ../../modules/fonts.nix
    ../../modules/stylix.nix
    ../../modules/home-manager.nix
    {
      home-manager.users.snuppy = {
        imports = [
          ./modules-hm/snuppy.nix
          inputs.sops-nix.homeManagerModule
          ../../modules-hm/home-manager.nix
          ../../modules-hm/gnome.nix
          ../../modules-hm/stylix.nix
          ../../modules-hm/common-apps.nix
          ../../modules-hm/virtualization.nix
        ];
      };
    }
  ];
}
