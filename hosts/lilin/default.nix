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
    ../../common-modules.nix
    # ../../modules/gnome.nix
    ../../modules/niri.nix
    {
      home-manager.users.snuppy = {
        imports = [
          ./modules-hm/snuppy.nix
          # ../../modules-hm/gnome.nix
          ../../modules-hm/mpd.nix
          ../../modules-hm/kanshi.nix
        ];
      };
    }
  ];
}
