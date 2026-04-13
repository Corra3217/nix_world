{ pkgs, lib, ... }:
{
	programs.steam.enable = true;
	nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
		"steam"
		"steam-original"
		"steam-unwrapped"
		"steam-run"
		"Oracle_VirtualBox_Extension_Pack"
		"discord"
	];

	environment.systemPackages = with pkgs; [
		discord
	];
}
