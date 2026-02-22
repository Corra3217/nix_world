{ ... }:
{
	services = {
		libinput.enable = true;
		logind.settings.Login = {
			HandleLidSwitch = "lock";
			HandleLidSwitchExternalPower = "lock";
			HandleLidSwitchDocked = "lock";
		};
	};
}
