{ pkgs, ... }:
{
	services = {
		xserver.windowManager.qtile.enable = true;
		picom = {
			enable = true;
			backend = "glx";
			fade = true;
			activeOpacity = 1.0;
			inactiveOpacity = 1.0;
		};
	};

	environment.systemPackages = with pkgs; [
		rofi
			pamixer
			pavucontrol
			brightnessctl
			alacritty
	];
}
