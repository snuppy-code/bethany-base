{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.groups.handygirl.gid = 2017;

  users.users.handygirl = {
    description = "remote builder user";
    group = "handygirl";
    isSystemUser = true;
    extraGroups = [
    ];
    openssh.authorizedKeys.keys = [
      "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAIKULoTLRUxXh/H32tYRncHD4KGxXZC2lUryf0X5w6QMPAAAABHNzaDo= snuppy.code@pm.me"
      "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAICuhkoAERcZcbsZ5ikVVpcUJyHhN1YAUw0WDpBDn+sOKAAAABHNzaDo= freya.ly@pm.me"
    ];
  };
}
