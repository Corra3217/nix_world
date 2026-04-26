{ pkgs, ... }: 
{
	hardware = {
		enableRedistributableFirmware = true;
		graphics = {
			enable = true;
			enable32Bit = true;
		};
	};

	powerManagement.enable = true;
	services.power-profiles-daemon.enable = true;

	zramSwap = {
		enable = true;
		memoryPercent = 30;
	};

	environment.systemPackages = with pkgs; [
		vulkan-tools
		mesa
		gamescope
	];
}
