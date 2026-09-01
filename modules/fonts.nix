{
  pkgs,
  inputs,
  ...
}: {
  fonts.enableDefaultPackages = true;
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    vista-fonts
    corefonts
    liberation_ttf
    vazir-fonts
    fira-code
    fira-code-symbols
    droid-sans-mono
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts

    nerd-fonts._0xproto
    nerd-fonts.jetbrains-mono
    nerd-fonts.adwaita-mono
    nerd-fonts.agave
    nerd-fonts.arimo
    nerd-fonts.aurulent-sans-mono
    nerd-fonts.bigblue-terminal
    nerd-fonts.caskaydia-mono
    nerd-fonts.commit-mono
    nerd-fonts.departure-mono
    nerd-fonts.dejavu-sans-mono
    nerd-fonts.go-mono
    nerd-fonts.inconsolata
    nerd-fonts.iosevka-term
    nerd-fonts.iosevka-term-slab
    nerd-fonts.overpass
    nerd-fonts.sauce-code-pro
    nerd-fonts.tinos
  ];
}
