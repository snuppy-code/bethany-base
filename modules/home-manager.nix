{
  config,
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}: {
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = {
    inherit inputs;
    inherit pkgs-unstable;
  };
  home-manager.backupFileExtension = "hm_bak";
}
