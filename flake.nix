{
	description = "My flexible system config flake";

	inputs = {
		unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
		home-manager = {
			url = "github:nix-community/home-manager/release-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixvim = {
			url = "github:nix-community/nixvim/nixos-25.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, unstable, nixpkgs, home-manager, nixvim, ... } @ inputs:  
		let
		flake_dir = ./.;
		home_path = ./lines/home;
		system_path = ./lines/system;
		testpkgs = inputs.unstable.legacyPackages.x86_64-linux;
		system = "x86_64-linux";
		in  
	{  
		nixosConfigurations.NixBox = nixpkgs.lib.nixosSystem {
			inherit system;	
			specialArgs = { inherit inputs testpkgs system; };
			modules = [
				"${system_path}/configuration.nix"
				home-manager.nixosModules.home-manager  {
					home-manager = {  
						useGlobalPkgs = true;
						useUserPackages = true;
						backupFileExtension = "backup";
						extraSpecialArgs = { inherit inputs; };
						users.nixuser = import "${home_path}/home.nix";
					};
				}
			];
		};
	};
}
