{
  config,
  pkgs,
  inputs,
  ...
}: {
  security.sudo.extraConfig = "
    Defaults timestamp_timeout=0.5 # 0.5m, i.e. 30s
  ";

  security.pam.services.sudo.rssh = true;
  security.pam.rssh.enable = true;
  security.pam.rssh.settings = let
    esc = builtins.fromJSON ''"\u001b"'';
  in {
    cue = true;
    cue_prompt = "${esc}[1;35mVerify presence: Bloodtype ORANGE${esc}[0m";
    auth_key_file = "/etc/ssh/authorized_keys.d/$ruser";
  };
  # programs.yubikey-touch-detector.enable = true;
  # programs.yubikey-touch-detector.libnotify = false;
  # todo write an application or script that has a cool themed notification

  services.pcscd.enable = true;
}
