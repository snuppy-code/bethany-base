{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.ssh.startAgent = true;
  services.gnome.gcr-ssh-agent.enable = false;
}
