{
  config,
  pkgs,
  inputs,
  ...
}: {
  sops = {
    age.keyFile = "/home/snuppy/.config/sops/age/keys.txt";

    defaultSopsFile = ../secrets.yaml;
    defaultSymlinkPath = "/run/user/1000/secrets";
    defaultSecretsMountPoint = "/run/user/1000/secrets.d";
  };
}
