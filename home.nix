{ config, pkgs, inputs, ... }:

{

	imports = [
		inputs.caelestia.homeManagerModules.default
		./hypr-binds.nix
		./hypr-settings.nix
		./niri-binds.nix
		];

	programs.caelestia = {
		enable = true;
		cli.enable = true;
		systemd.enable = true;
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
		];

	programs.home-manager.enable = true;
		
}

	
