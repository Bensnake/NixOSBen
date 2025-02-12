{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/home-manager/neovim.nix
    ../../modules/home-manager/mpv.nix
    #../../modules/home-manager/hyprland.nix
    inputs.nixvim.homeManagerModules.nixvim
    inputs.nix-colors.homeManagerModules.default
  ];

  home.username = "ben";
  home.homeDirectory = "/home/ben";

  home.stateVersion = "23.11";

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
    # EDITOR = "nvim";
  };

  colorScheme = inputs.nix-colors.colorSchemes.onedark;

  programs.home-manager.enable = true;
}
