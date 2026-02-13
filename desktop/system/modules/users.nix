{ config, lib, pkgs, testpkgs, ... }:
let 
generic_user = { 
	isNormalUser = true;
	extraGroups = [ "wheel" "networkmanager" ];
	packages = with pkgs; [
		testpkgs.gcc
			testpkgs.tor-browser
			testpkgs.tigervnc
			testpkgs.fastfetch
			kdePackages.elisa
			discord
	];
};
in
{
	users.users.nixuser = (generic_user); 
}
