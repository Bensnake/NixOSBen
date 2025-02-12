{config, pkgs, ...}:

{
	services.hyprpaper = {
		enable = true;
		settings = {
			ipc = "on";
			splash = false;
			splash_offset = 2.0;

			preload =
				[ "/home/ben/Pictures/WayOfKings.jpg" ];

			wallpaper = [
				"eDP-1,/home/ben/Pictures/WayofKings.jpg"
				"HDMI-A-1,/home/ben/Pictures/WayOfKings.jpg"
			];
		};
	};
}
