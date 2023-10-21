{config, pkgs, ...}:

{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/Pictures/omer-tunc-sds-copy.jpg
    wallpaper = DP-1,~/Pictures/omer-tunc-sds-copy.jpg
  '';
}
