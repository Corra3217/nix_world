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
#		blueman.enable = true;
		pipewire = {
			enable = true;
			pulse.enable = true;
		};
		displayManager.sddm = {
			enable = true;
			wayland.enable = true;
			theme = "where-is-my-sddm-theme";
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
		testpkgs.pcmanfm

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
		pamixer
		pavucontrol
		brightnessctl	
		alacritty 
		kitty
		nano
		vim
		tree
		gedit
		nil
		gimp
	];
}

