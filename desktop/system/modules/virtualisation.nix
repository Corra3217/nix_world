{ ... }:
{
	virtualisation.virtualbox = {
		host = {
			enable = true;
			enableExtensionPack = true;
			enableKvm = true;
			addNetworkInterface = false;
		};
	};
}
