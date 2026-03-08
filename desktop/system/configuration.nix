{ config, lib, pkgs, testpkgs, ... }:
{
	imports = [ ./modules ];

	system.stateVersion = "25.11";

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

	networking = {
		hostName = "NixBox";
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
    # unstable packages
		testpkgs.man-db
		testpkgs.man-pages
		testpkgs.man-pages-posix
		testpkgs.git
		testpkgs.tealdeer
		testpkgs.wayland-utils
    testpkgs.gcc
    testpkgs.clang

    # user apps
    testpkgs.tor-browser
		testpkgs.firefox
    testpkgs.signal-desktop
		testpkgs.gimp
		testpkgs.vlc
    zathura

    # kdePackages
		kdePackages.isoimagewriter 
		kdePackages.partitionmanager
    kdePackages.filelight
    kdePackages.elisa

    # cli
		nano
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
		wl-clipboard
		hardinfo2 
		rofi
		pamixer
		brightnessctl
		alacritty 
		nil
	];
}
