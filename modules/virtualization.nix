{
  config,
  pkgs,
  inputs,
  ...
}: {
  # note that "kvm-intel" and "kvm-amd" kernelModules are set in laptop and desktop respectively !
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
    };
  };

  environment.systemPackages = [
    pkgs.spice-vdagent
  ];
}
