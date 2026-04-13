{ config, lib, pkgs, testpkgs, ... }:
{
	imports = [ ./modules ];

	system.stateVersion = "25.11";

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	hardware = {
		bluetooth.enable = true;
		graphics = {
			enable = true;
			enable32Bit = true;
		};
	};

	networking = {
		hostName = "NixBox";
		networkmanager.enable = true;
		firewall.enable = true;
		# firewall.allowedUDPPorts = [
		#   53
		#   67 
		# ];
	};

	time.timeZone = "Australia/Sydney";

	powerManagement.enable = true;

	services = {
		blueman.enable = true;

		pipewire = {
			enable = true;
			pulse.enable = true;
		};

		displayManager.gdm.enable = true;
		desktopManager.gnome.enable = true;
		gnome = {
			core-apps.enable = true;
			games.enable = false;	
		};
	};

		environment.systemPackages = with pkgs; [
			# unstable packages
			testpkgs.man-db
			testpkgs.man-pages
			testpkgs.man-pages-posix
			testpkgs.gcc
			testpkgs.clang
			testpkgs.git 

			# user apps
			testpkgs.tor-browser
			testpkgs.firefox
			testpkgs.signal-desktop
			testpkgs.tigervnc
			testpkgs.vlc
			zathura

			# cli
			neovim
			vim
			tree
			ascii
			wget
			htop
			iwd
			tealdeer
			usbutils
			neofetch

			# system apps
			gnome-tweaks
		        gnome-console
		        gnome-terminal
		        gnome-bluetooth
		        gnome-commander
			hardinfo2 
			nil
		];
	}
