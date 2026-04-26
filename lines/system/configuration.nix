{ config, lib, pkgs, testpkgs, ... }:
{
	imports = [ ./modules ];

	system.stateVersion = "25.11";

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;


	networking = {
		hostName = "NixBox";
		networkmanager.enable = true;
		firewall.enable = true;
	};

	time.timeZone = "Australia/Sydney";

  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      libpinyin
    ];
  };

	powerManagement.enable = true;
	programs.dconf.enable = true;

	services = {
		blueman.enable = true;
		power-profiles-daemon.enable = true;
		thermald.enable = true;

		pipewire = {
			enable = true;
			pulse.enable = true;
			alsa.enable = true;
			alsa.support32Bit = true;
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
			testpkgs.clang-tools
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
      gnomeExtensions.ddterm
			gnome-tweaks
      gnome-console
      gnome-terminal
      gnome-bluetooth
      gnome-commander
			hardinfo2 
      nil
		];
	}
