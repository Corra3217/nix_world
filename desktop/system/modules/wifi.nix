{ pkgs, ... }:
{
	boot = {
		kernelModules = [ "rtw89pci" "rtw89usb" ];
		kernelPackages = pkgs.linuxPackages_latest;
	};

	hardware = {
		enableRedistributableFirmware = true;
		bluetooth.enable = true;
	};
}
