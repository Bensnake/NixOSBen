{config, pkgs, inputs, ...}:

{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

  programs.hyprpanel = {
        enable = true;
        overlay.enable = true;
        hyprland.enable = true;
        overwrite.enable = true;
  };
}
