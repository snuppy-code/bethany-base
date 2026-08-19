{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.groups.nerv-staff.gid = 2010;
  users.groups.snuppy.gid = 2005;

  sops.secrets.snuppy-password.neededForUsers = true;
  users.users.snuppy = {
    description = "colon three";
    group = "snuppy";
    isNormalUser = true;
    extraGroups = [
      "users"
      "nerv-staff"
      "petrova"
      "wheel"
      "networkmanager"
      "adbusers"
      "libvirtd"
      "dialout"
      "cdrom"
    ];
    hashedPasswordFile = config.sops.secrets.snuppy-password.path;
    openssh.authorizedKeys.keys = [
      "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIKULoTLRUxXh/H32tYRncHD4KGxXZC2lUryf0X5w6QMPAAAABHNzaDo= snuppy.code@pm.me"
      "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAICuhkoAERcZcbsZ5ikVVpcUJyHhN1YAUw0WDpBDn+sOKAAAABHNzaDo= freya.ly@pm.me"
    ];
  };
}
