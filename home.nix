{ config, pkgs, inputs, ... }:

{

         # Allow unfree packages
         nixpkgs.config.allowUnfree = true;

	imports = [
		./hypr-binds.nix
		./hypr-settings.nix
		./niri-binds.nix
		inputs.noctalia.homeModules.default
		];

	programs.noctalia = {
		enable = true;

		settings = {
			theme = {
				mode = "dark";
				source = "builtin";
				builtin = "Catppuccin";
				};

			wallpaper = {
				enabled = true;
				default.path = "./forest.jpg";
				};
			};
		};	

	home.username = "kaiguaaaa";
	home.homeDirectory = "/home/kaiguaaaa";
	home.stateVersion = "26.05";

	home.packages = with pkgs; [
		ripgrep
		fastfetch
		nautilus
		git
		fragments
		howdy
		vscodium
		gcc
		gnumake
		cmake
		helium
		kitty
		fish
		bottles
		fish
		parabolic
		wine
		speedtest-cli
		spotdl
		gallery-dl
		gopeed
		kdePackages.dolphin
		gnome-disk-utility
		unzip
		kdePackages.ark
		wine 
		winetricks
		localsend
		telegram-desktop
		reaper
		qtractor
		lmms
		];

	programs.home-manager.enable = true;

	programs.fish = {
		enable = true;
		};		
}

	
