{ config, lib, pkgs, testpkgs, ... }:
{
	imports = [ ./modules ];

	system.stateVersion = "25.11";

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking = {
		hostName = "NixPad";
		networkmanager.enable = true;
		firewall.enable = true;
	};

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
		testpkgs.firefox
		testpkgs.git
		testpkgs.tealdeer
		testpkgs.vlc
		testpkgs.wayland-utils

		kdePackages.isoimagewriter 
		kdePackages.partitionmanager

		nano
		vim
		tree
		ascii
		wget
		htop
		iwd
		tealdeer
		usbutils
		wl-clipboard

		hardinfo2 
		rofi
		alacritty 
		gedit
		nil
		gimp
	];
}
