{
	description = "Hyprland Flake!";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
		hyprland.url = "github:hyprwm/Hyprland";
	};

	outputs = { self, nixpkgs, hyprland }: {
		packages.x86_64-linux.hyprland = with nixpkgs.pkgs; hyprland;
	};
}
