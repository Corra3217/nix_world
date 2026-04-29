{ lib, ... }:
{
	imports = [
		/etc/nixos/hardware-configuration.nix
    ./packages.nix
		./users.nix
		./amd.nix
		#./nvidia.nix
		#./virtualisation.nix
		./unfree.nix
	];
}
