{ config, lib, pkgs, testpkgs, ... }:
let 
generic_user = { 
	isNormalUser = true;
	extraGroups = [ "wheel" "networkmanager" ];
	packages = with pkgs; [
			testpkgs.tigervnc
			fastfetch
			discord
	];
};
in
{
	users.users.nixuser = (generic_user); 
}
