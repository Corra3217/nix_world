{ lib, ... }:
{
	imports = [
		/etc/nixos/hardware-configuration.nix
		./users.nix
		./nvidia.nix
		#./virtualisation.nix
		#./unfree.nix
	];
}
