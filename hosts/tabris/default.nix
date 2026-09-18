{
  config,
  inputs,
  ...
}: {
  imports = [
    ./modules/hardware-configuration.nix
    ./modules/os.nix
    ./modules/gpu.nix
    ./modules/cuda.nix
    inputs.sops-nix.nixosModules.sops
    inputs.nvf.nixosModules.default
    inputs.stylix.nixosModules.stylix
    inputs.home-manager.nixosModules.home-manager
    inputs.nix-flatpak.nixosModules.nix-flatpak
    ../../common-modules.nix
    ../../modules/gnome.nix
    ../../modules/coolercontrol.nix
    {
      home-manager.users.snuppy = {
        imports = [
          ./modules-hm/snuppy.nix
          ../../modules-hm/gnome.nix
        ];
      };
    }
  ];
}
