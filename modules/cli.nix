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
    yazi
    caligula
    tmux
    wl-clipboard
    delta
    fzf
    ripgrep
    fd
    lnav
    python314
    sshfs
    b3sum
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
    starship
  ];
  services.locate = {
    enable = true;
    package = pkgs.plocate;
  };
  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
}
