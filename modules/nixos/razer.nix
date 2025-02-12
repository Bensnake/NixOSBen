{ config, pkgs, lib, ... }:

{
  hardware.openrazer = {
    enable = true;
    users = [ "ben" ];
  };

  environment.systemPackages = with pkgs; [
    openrazer-daemon
    polychromatic
  ];
}
