{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    inputs.nvf.homeManagerModules.default
    inputs.textfox.homeManagerModules.default

    #../../modules/home-manager/neovim.nix
        ../../modules/home-manager/nvf.nix
        ../../modules/home-manager/mpv.nix
                #../../modules/home-manager/textfox.nix
        ../../modules/home-manager/librewolf.nix
    #../../modules/home-manager/hyprland.nix
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

  programs.home-manager.enable = true;
}
