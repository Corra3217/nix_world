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
    firewall.allowedUDPPorts = [
      53
      67 
    ];
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
    # unstable packages
		testpkgs.man-db
		testpkgs.man-pages
		testpkgs.man-pages-posix
		testpkgs.tealdeer
		testpkgs.git
		testpkgs.wayland-utils
    testpkgs.gcc
    testpkgs.clang

    # user apps
    testpkgs.tor-browser
		testpkgs.firefox
    testpkgs.signal-desktop
    testpkgs.tigervnc
		testpkgs.pcmanfm
		testpkgs.vlc
    testpkgs.blender
    testpkgs.nmap
    testpkgs.netcat
    zathura

    # kde packages
		kdePackages.isoimagewriter 
		kdePackages.partitionmanager
    kdePackages.dolphin
    kdePackages.filelight
    kdePackages.elisa

    # cli
    tree
		ascii
		wget
		htop
    vim
		iwd
		tealdeer
		usbutils
    neofetch

    # system apps
		rofi
		pamixer
		pavucontrol
		brightnessctl	
		alacritty 
		kitty
		hardinfo2 
		wl-clipboard
		nil
	];
}

