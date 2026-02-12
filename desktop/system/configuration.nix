{ config, lib, pkgs, testpkgs, ... }:
{
	imports = [ ./modules ];

	system.stateVersion = "25.11";

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	boot.loader = {
		systemd-boot.enable = true;
		efi.canTouchEfiVariables = true;
	};


	networking.hostName = "NixPad";
	networking.networkmanager.enable = true;

	time.timeZone = "Australia/Sydney";

	powerManagement.enable = true;

	nixpkgs.config.allowUnfree = true;

	services = {
		blueman.enable = true;

		pipewire = {
			enable = true;
			pulse.enable = true;
		};

		displayManager.ly = {
			enable = true;
		};
	};

	environment.systemPackages = with pkgs; [
		testpkgs.man-db
		testpkgs.man-pages
		testpkgs.man-pages-posix
		testpkgs.tealdeer
		testpkgs.git
		testpkgs.firefox
		testpkgs.vlc
		testpkgs.wayland-utils

		kdePackages.isoimagewriter 
		kdePackages.partitionmanager

		ascii
		wget
		htop
		iwd
		tealdeer
		hardinfo2 
		usbutils
		wl-clipboard

		rofi
#		pamixer
#		pavucontrol
#		brightnessctl	
		alacritty 
		nano
		vim
		tree
		gedit
		nil
		gimp
	];
}
