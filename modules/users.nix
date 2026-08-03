{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.groups.nerv-staff.gid = 2010;

  sops.secrets.snuppy-password.neededForUsers = true;
  users.users.snuppy = {
    description = "snuppy";
    isNormalUser = true;
    extraGroups = [
      "nerv-staff"
      "petrova"
      "wheel"
      "networkmanager"
      "adbusers"
      "libvirtd"
      "dialout"
      "cdrom"
    ];
    # uid = 2004; # todo: uncomment this line,, and hope it doesn't fuck everything up
    hashedPasswordFile = config.sops.secrets.snuppy-password.path;
    openssh.authorizedKeys.keys = [
      "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIKULoTLRUxXh/H32tYRncHD4KGxXZC2lUryf0X5w6QMPAAAABHNzaDo= snuppy.code@pm.me"
    ];
  };
}
