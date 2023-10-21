{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./features/hyprland.nix
    ./features/hyprpaper.nix
    ./features/waybar.nix
    ./features/swaylock.nix
    ./features/gtk.nix
    ./features/wlogout/default.nix
    ./features/rofi.nix
    ./features/swayidle.nix
    ./features/neovim.nix
    ./features/alacritty.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.onedark;

  home.username = "ben";
  home.homeDirectory = "/home/ben";

  home.stateVersion = "23.05";


  home.packages = [
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
