{ config, lib, pkgs, testpkgs, ... }:
let 
generic_user = { 
	isNormalUser = true;
	extraGroups = [ "wheel" "networkmanager" ];
	packages = with pkgs; [ ];
};
in
{
	users.users.nixuser = (generic_user); 
}
