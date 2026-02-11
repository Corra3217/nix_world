{ config, pkgs, ... }:
let 
	dotfiles_dir = "${config.home.homeDirectory}/nix_world/dotfiles";
	create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
	snr = "sudo nixos-rebuild ";
	etc-flag = " -I nixos-config=/etc/nixos/configuration.nix";
	flake-flag = " --flake ~/nix_world/desktop#NixPad";
	configs = {
		alacritty = "alacritty";
		fastfetch = "fastfetch";
		rofi = "rofi";
		hypr = "hypr";
	};
in
{
	home = {
		username = "nixuser";
		homeDirectory = "/home/nixuser";
		stateVersion = "25.11";
	};

	xdg.configFile =
		builtins.mapAttrs (name: subpath: {
				source = create_symlink "${dotfiles_dir}/${subpath}";
				recursive = true;
	}) configs;

	home.file =
		builtins.mapAttrs (name: subpath: {
				source = create_symlink "${dotfiles_dir}/${subpath}";
				}) {
			".vimrc" = "vim/vimrc";
		};

	programs = {
		bash = {
			enable = true;
			shellAliases = {
				cde = "cd /etc/nixos && su";
				rebuild = snr + "switch" + etc-flag;
				redo = snr + "boot" + etc-flag + " && reboot";
				test = snr + "test" + etc-flag;

				cdf = "cd ~/nix_world/desktop";
				rebuildf = snr + "switch" + flake-flag;
				redof = snr + "boot" + flake-flag + " && reboot";
				testf = snr + "test" + flake-flag;

				ff = "clear && fastfetch";
				btw = "echo I use NixOS, btw";

				# needs those ports open
				giveEthernet = "nmcli connection show && nmcli connection modify \"Wired connection 1\" ipv4.method shared && nmcli connection modify \"Wired connection 1\" ipv6.method ignore && nmcli connection down \"Wired connection 1\" && nmcli connection up \"Wired connection 1\"";
			};
		};
	};
}
