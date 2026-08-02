{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.git = {
    enable = true;
    config = {
      safe.directory = "/etc/nixos/terminal-dogma";
      init.defaultBranch = "main";
      user.name = "snuppy";
      user.email = "snuppy.code@pm.me";
    };
  };
}
