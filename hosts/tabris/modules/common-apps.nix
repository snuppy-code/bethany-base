{
  config,
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs;
    [
      # jstest-gtk
    ]
    ++ [
      #inputs.helium.packages.${pkgs.system}.default
      #inputs.slon.packages.${pkgs.system}.default
      #inputs.sable.packages.${pkgs.system}.sable-desktop
      #pkgs-unstable.nextcloud-client
    ];
}
