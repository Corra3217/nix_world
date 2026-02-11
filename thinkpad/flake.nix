{
	description = "My Allied desktop system flake";

	inputs = {
		unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, ... } @ inputs:  
		let
		flake_dir = ./.;
		dotfiles_dir = ./system/modules/dotfiles;
		system_path = ./system;
		testpkgs = inputs.unstable.legacyPackages.x86_64-linux;
		system = "x86_64-linux";
		in  
	{  
		nixosConfigurations.NixPad = nixpkgs.lib.nixosSystem {
			inherit system;	
			specialArgs = { inherit inputs testpkgs system; };
			modules = [
				"${system_path}/configuration.nix"
				home-manager.nixosModules.home-manager  {
					home-manager = {  
						useGlobalPkgs = true;
						useUserPackages = true;
						backupFileExtension = "backup";
						users.nixuser = import "${system_path}/home.nix";
					};
				}
			];
		};
	};
}
