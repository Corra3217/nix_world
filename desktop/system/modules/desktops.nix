{ config, pkgs, ...}:
{
	programs = {
		hyprland.enable = true;
		steam = { 
			enable = true;
			gamescopeSession.enable = true;
		};
		gamescope.enable = true;
		nh.enable = true;
	};

	services = {
		xserver.windowManager.qtile.enable = true;
		desktopManager.plasma6.enable = true;
	};

	environment.systemPackages = with pkgs; [
		hyprpaper
		hyprpicker
		kitty
	];
}
