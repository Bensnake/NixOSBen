{ config, pkgs, lib, inputs, ... }:

{
  imports = [ inputs.stylix.nixosModules.stylix ];

  environment.systemPackages = with pkgs; [ base16-schemes ];

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";

  stylix.image = /home/ben/Pictures/stephen-li-honor1080.jpg;
}
