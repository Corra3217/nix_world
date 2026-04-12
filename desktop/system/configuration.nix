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

    displayManager.gdm.enable = true;
    desktopManager.gnome = {
      enable = true;
      core-apps.enable = false;
      core-developer-tools.enable = false;
      games.enable = false;
    }
	};

	environment.systemPackages = with pkgs; [
    # unstable packages
		testpkgs.man-db
		testpkgs.man-pages
		testpkgs.man-pages-posix
    testpkgs.gcc
    testpkgs.clang

    # user apps
    testpkgs.tor-browser
		testpkgs.firefox
    testpkgs.signal-desktop
    testpkgs.discord
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
		hardinfo2 
		nil
	];
}
