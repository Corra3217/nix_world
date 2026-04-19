{ ... }:
{
	nixpkgs.config.allowUnfree = true;
	services.xserver.videoDrivers = [ "nvidia" ];
	hardware = {
		bluetooth.enable = true;
		graphics.enable = true;
		opengl.enable = true;
		nvidia = {
			open = false;
			modesetting.enable = true;
			powerManagement.enable = true;
			nvidiaSettings = true;
			prime = {
				offload.enable = true;
				intelBusId = "PCI:0:2:0";
				nvidiaBusId = "PCI:3:0:0";
			};
		};
	};
}
