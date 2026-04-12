{ ... }:
{
	nixpkgs.config.pulseaudio = true;
	services.xserver = {
		enable = true;
		desktopManager = {
			xterm.enable = true;
			xfce.enable = true;
		};
	};
}
