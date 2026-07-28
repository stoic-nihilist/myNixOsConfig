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
		distro-grub-themes = {
			url = "github:AdisonCavani/distro-grub-themes";
			inputs.nixpkgs.follows = "nixpkgs";
			};
		mangowm = {
			url = "github:mangowm/mango";
			inputs.nixpkgs.follows = "nixpkgs";
			};
		scroll = {
			url = "github:AsahiRocks/scroll-flake";
			inputs.nixpkgs.follows = "nixpkgs";
			};
		hyprland = {
			url = "github:hyprwm/Hyprland";
			inputs.nixpkgs.follows = "nixpkgs";
			};

		hyprland-plugins = {
			url = "github:hyprwm/hyprland-plugins";
			inputs.hyprland.follows = "hyprland";
			};
		};

	outputs = inputs@{ self, nixpkgs, home-manager, helium-browser, silentSDDM, noctalia, distro-grub-themes, mangowm, scroll, hyprland, hyprland-plugins, ... }:
	{
		nixosConfigurations.latitude5420 = 
	
		nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = { 
				inherit inputs;
				inherit distro-grub-themes;
				 };
			modules = [
				./configuration.nix
				silentSDDM.nixosModules.default
				distro-grub-themes.nixosModules.x86_64-linux.default
				mangowm.nixosModules.mango
				scroll.nixosModules.default
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
