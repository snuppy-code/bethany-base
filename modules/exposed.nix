{
  pkgs,
  inputs,
  ...
}: {
  networking.firewall.interfaces.tailscale0.allowedTCPPorts = [
    22 # ssh on tailscale only
  ];
  services.openssh = {
    enable = true;
    openFirewall = false;
    settings = {
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      X11Forwarding = false;
      AllowUsers = ["snuppy"];
    };
  };

  # todo replace with something dynamically changing
  users.motd = "God's in his heaven, all's right with the world."; # NGE reference !!!
}
