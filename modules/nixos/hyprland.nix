{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  	brightnessctl
	hyprpaper
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  services.hypridle.enable = true;
  programs.hyprlock.enable = true;
}
