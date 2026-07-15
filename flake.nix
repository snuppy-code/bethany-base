{
  description = ":3c";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.7.0";

    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:nix-community/stylix/release-26.05";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    helium.url = "github:schembriaiden/helium-browser-nix-flake";
    helium.inputs.nixpkgs.follows = "nixpkgs";

    nix-gaming.url = "github:fufexan/nix-gaming";

    nix-citizen.url = "github:LovingMelody/nix-citizen";
    nix-citizen.inputs.nix-gaming.follows = "nix-gaming";

    finnjobtool.url = "git+ssh://git@github.com/snuppy-code/finnjobbtool?ref=sidelined-work";
    finnjobtool.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    nvf,
    nix-flatpak,
    sops-nix,
    stylix,
    helium,
    nix-gaming,
    nix-citizen,
    finnjobtool,
  } @ inputs: {
    nixosConfigurations.lilin = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit inputs;
      };
      modules = [
        ./hosts/lilin/modules/hardware-configuration.nix
        ./hosts/lilin/modules/hardware-myextra.nix
        ./hosts/lilin/modules/throttle.nix
        sops-nix.nixosModules.sops
        nvf.nixosModules.default
        stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        nix-flatpak.nixosModules.nix-flatpak
        ./modules/sops.nix
        ./modules/base-hardware.nix
        ./modules/gnome.nix
        ./modules/virtualization.nix
        ./modules/regional.nix
        ./modules/audio.nix
        ./modules/security.nix
        ./modules/exposed.nix
        ./modules/nix.nix
        ./modules/users.nix
        ./modules/cli.nix
        ./modules/nvf.nix
        ./modules/common-apps.nix
        ./modules/thunar.nix
        ./modules/steam.nix
        ./modules/ld.nix
        ./modules/flatpak.nix
        ./modules/git-systemwide.nix
        ./modules/kde-connect.nix
        ./modules/syncthing.nix
        ./modules/fonts.nix
        ./modules/ssh.nix
        ./modules/stylix.nix
        ./modules/home-manager.nix
        {
          home-manager.users.snuppy = {
            imports = [
              inputs.sops-nix.homeManagerModule
              ./hosts/lilin/modules-hm/snuppy.nix
              ./modules-hm/home-manager.nix
              ./modules-hm/gnome.nix
              ./modules-hm/icons.nix
              ./modules-hm/virtualization.nix
            ];
          };
        }
      ];
    };
  };
}
