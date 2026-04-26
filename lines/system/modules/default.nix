{ lib, ... }:
{
	imports = [
		/etc/nixos/hardware-configuration.nix
		./users.nix
		./amd.nix
		#./nvidia.nix
		#./virtualisation.nix
		./unfree.nix
	];
}
