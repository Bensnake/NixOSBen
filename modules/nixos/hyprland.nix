{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
  	brightnessctl
	hyprpaper
    swaynotificationcenter
    hyprpolkitagent
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  services.hypridle.enable = true;
  programs.hyprlock.enable = true;
}
