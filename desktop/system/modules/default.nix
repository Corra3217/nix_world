{ lib, ... }:
{
	imports = [
		./hardware-configuration.nix
		./wifi.nix
		./users.nix
		./desktops
		./virtualisation.nix
		./steam.nix
	];
}
