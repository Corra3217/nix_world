{ lib, ... }:
{
	imports = [
		./hardware-configuration.nix
		./users.nix
		./virtualisation.nix
		./steam.nix
	];
}
