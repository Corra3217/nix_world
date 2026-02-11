{ config, lib, pkgs, testpkgs, ... }:
{
	imports = [ ./hardware-configuration.nix ];

	system.stateVersion = "25.11";

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	boot = {
		kernelModules = [ "rtw89pci" "rtw89usb" ];
		kernelPackages = pkgs.linuxPackages_latest;
		loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
		};
	};

	hardware.enableRedistributableFirmware = true;
	hardware.bluetooth.enable = true;

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

		desktopManager.plasma6.enable = true;
	};

	users = {
		extraGroups.vboxusers.members = [ "nixuser" ];
		users.nixuser = {
			isNormalUser = true;
			extraGroups = [ "wheel" "networkmanager" ];
			packages = with pkgs; [ 
				testpkgs.gcc
				testpkgs.tor-browser
				testpkgs.tigervnc
				testpkgs.fastfetch
				testpkgs.vlc
				kdePackages.elisa
				discord
				pipes
				cava
			];
		};
	};

	virtualisation.virtualbox = {
		host = {
			enable = true;
			enableExtensionPack = true;
			enableKvm = true;
			addNetworkInterface = false;
		};
	};

	programs = {
		steam = {
			enable = true; 
			gamescopeSession.enable = true;
		};
		gamescope.enable = true;
		nh.enable = true;
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
