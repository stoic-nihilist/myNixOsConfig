{ config, pkgs, inputs, ... }:

{

	imports = [
		inputs.caelestia.homeManagerModules.default
		./hypr-binds.nix
		./hypr-settings.nix
		./niri-binds.nix
		inputs.noctalia.homeModules.default
		];

	programs.caelestia = {
#		enable = true;
		cli.enable = true;
		systemd.enable = true;
		};


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
		];

	programs.home-manager.enable = true;

	programs.fish = {
		enable = true;
		};		
}

	
