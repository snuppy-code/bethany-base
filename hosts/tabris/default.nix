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
    inputs.qml-crap.nixosModules.default
    ../../common-modules.nix
    ../../modules/niri.nix
    ../../modules/niri-dynamic-windows
    ../../modules/coolercontrol.nix
    {
      home-manager.users.snuppy = {
        imports = [
          ./modules-hm/snuppy.nix
          ../../modules-hm/mpd.nix
          inputs.qml-crap.homeModules.default
          ../../modules-hm/qml-crap.nix
          ../../modules-hm/kanshi.nix
          ../../modules-hm/ashell.nix
        ];
      };
    }
  ];
}
