{config, pkgs, lib, ...}:

{
  hardware.nvidia = {
    open = false;

    modesetting.enable = true;
    nvidiaSettings = true;
    # powerManagement.enable = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  services.xserver.videoDrivers = ["amdgpu" "nvidia"];
}
