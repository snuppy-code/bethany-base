{
  config,
  pkgs,
  inputs,
  ...
}: {
  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";
      user.name = "snuppy";
      user.email = "snuppy.code@pm.me";
    };
  };
}
