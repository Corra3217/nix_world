{ pkgs, ... }:
{
  imports = [ ./modules ];

  system.stateVersion = "25.11";


  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    optimise.automatic = true;
  };

  networking = {
    hostName = "NixBox";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  time.timeZone = "Australia/Sydney";

  i18n.inputMethod = {
    enable = true;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      libpinyin
    ];
  };

  documentation.man.enable = true;
  powerManagement.enable = true;
  programs.dconf.enable = true;

  services = {
    blueman.enable = true;
    power-profiles-daemon.enable = true;
    thermald.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
    };

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    gnome = {
      core-apps.enable = true;
      games.enable = false;	
    };
  };
}
