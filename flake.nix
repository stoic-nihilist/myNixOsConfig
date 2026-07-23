{

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

		home-manager.url = "github:nix-community/home-manager/release-26.05";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
		
		helium-browser = {
			url = "github:oxcl/nix-flake-helium-browser";
			inputs.nixpkgs.follows = "nixpkgs";
			};

		silentSDDM = {
			url = "github:uiriansan/SilentSDDM";
			inputs.nixpkgs.follows = "nixpkgs";
			};
		
		noctalia = {
			url = "github:noctalia-dev/noctalia";
			inputs.nixpkgs.follows = "nixpkgs";
			};

	outputs = inputs@{ self, nixpkgs, home-manager, helium-browser, silentSDDM, noctalia, ... }:
	{
		nixosConfigurations.latitude5420 = 
		nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = { inherit inputs; };
			modules = [
				./configuration.nix
				silentSDDM.nixosModules.default
				{
				nixpkgs.overlays = [ 
					helium-browser.overlays.default 
					];
				programs.silentSDDM = {
					enable = true;
					theme = "catppuccin-mocha";
					};
				}
				];
			};

		homeConfigurations.kaiguaaaa = 
		home-manager.lib.homeManagerConfiguration {
			pkgs = import nixpkgs {
				system = "x86_64-linux";
				overlays = [ helium-browser.overlays.default ];
				};
			extraSpecialArgs = { inherit inputs; };
			modules = [ ./home.nix ];
		};
	};
}
