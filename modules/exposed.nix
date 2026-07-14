{
  pkgs,
  inputs,
  ...
}: {
  # --- server ----
  services.tailscale.enable = true;
  networking.firewall.interfaces.tailscale0.allowedTCPPorts = [
    22 # ssh
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
  users.motd = "God's in his heaven, all's right with the world."; # NGE reference !!!
}
