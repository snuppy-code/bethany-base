{
  config,
  lib,
  pkgs,
  ...
}: {
  services.udev.packages = [
    (pkgs.writeTextFile {
      name = "thrustmaster-rudder-nya";
      text = ''
        SUBSYSTEM=="hidraw", ATTRS{idVendor}=="044f", ATTRS{idProduct}=="b68f", TAG+="uaccess"
      '';
      destination = "/etc/udev/rules.d/70-thrustmaster-rudder-nya.rules";
    })
  ];
}
