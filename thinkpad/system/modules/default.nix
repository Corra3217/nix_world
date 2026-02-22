{ lib, ... }:
{
	imports = [
		./hardware-configuration.nix
		./users.nix
		./desktops
		./virtualisation.nix
		./laptop.nix
#		./steam.nix
	];
}
