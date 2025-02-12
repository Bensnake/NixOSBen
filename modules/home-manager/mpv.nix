{pkgs, config, ...}:

{
  programs.mpv = {
  	enable = true;
	scripts = with pkgs.mpvScripts; [
		mpris
		webtorrent-mpv-hook
		thumbfast
		mpv-playlistmanager
		modernx-zydezu
		memo
	];
  };
}
