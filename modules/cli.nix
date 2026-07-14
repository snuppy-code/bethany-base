{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # os
    stow
    sops
    age

    # tools
    ouch
    cloc
    btop
    tree
    bat
    caligula
    wl-clipboard
    delta
    fzf
    ripgrep
    fd
    lnav
    python314
    plocate
    killall
    file
    iw
    dig
    whois
    netcat
    nettools
    pciutils
    lshw
    inxi
    iperf3
    clinfo

    # tooling
    alejandra
    nil
    nixd

    # fun
    fastfetch
    speedtest-cli
  ];
  services.locate = {
    enable = true;
    package = pkgs.plocate;
  };
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
}
