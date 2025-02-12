{ config, pkgs, lib, ... }:

{
    hardware.nvidia = {
      prime = {
      	sync.enable = true;

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      };
    };

  specialisation = {
    nvidia-offload.configuration = {
    	system.nixos.tags = [ "nvidia-offload" ];
	hardware.nvidia = {
	  powerManagement.finegrained = lib.mkForce true;

	  prime = {
	    sync.enable = lib.mkForce false;
	    offload = {
		    enable = lib.mkForce true;
		    enableOffloadCmd = lib.mkForce true;
	  };
	};
      };
    };
  };
}
