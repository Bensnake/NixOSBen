{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [ base16-schemes ];

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";

  stylix.image = /home/ben/Pictures/Wallpapers/gargantua.png;
}
