{config, pkgs, ...}:

{
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ~/Pictures/omer-tunc-sds.jpg
    wallpaper = DP-1,~/Pictures/omer-tunc-sds.jpg
  '';
}
