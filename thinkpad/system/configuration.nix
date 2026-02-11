{ config, lib, pkgs, testpkgs, ... }:
{
	imports = [ ./hardware-configuration.nix ];

	system.stateVersion = "25.11";
	
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	networking.hostName = "NixPad";
	networking.networkmanager.enable = true;

	time.timeZone = "Australia/Sydney";

	powerManagement.enable = true;

	nixpkgs.config.allowUnfree = true;

	services = {
		libinput.enable = true;
		logind.settings.Login = {
			HandleLidSwitch = "lock";
			HandleLidSwitchExternalPower = "lock";
			HandleLidSwitchDocked = "lock";
		};
		pipewire = {
			enable = true;
			pulse.enable = true;
		};
		xserver = {
			enable = true;
			desktopManager.xfce.enable = true;
			windowManager.qtile.enable = true;			
		};
		displayManager.sddm = {
			enable = true;
			wayland.enable = true;
			theme = "where-is-my-sddm-theme";
		};
		picom = {
			enable = false;
			backend = "glx";
			fade = true;
			activeOpacity = 1.0;
			inactiveOpacity = 1.0;
		};
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

