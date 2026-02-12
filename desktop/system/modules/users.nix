{ config, lib, pkgs, testpkgs, ... }:
{
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
}
