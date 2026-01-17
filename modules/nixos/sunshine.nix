{config, pkgs, lib, ...}:

{
  services.sunshine = {
	  enable = true;
	  autoStart = false;
	  capSysAdmin = true;
	  openFirewall = true;
  };
  services.tailscale.enable = true;
}
