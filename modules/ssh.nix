{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.ssh.startAgent = true;
}
