{ config, pkgs, inputs, ... }:

{

         # Allow unfree packages
         nixpkgs.config.allowUnfree = true;

	imports = [
		./hypr-binds.nix
		./hypr-settings.nix
		./niri-binds.nix
		inputs.noctalia.homeModules.default
		inputs.dms.homeModules.dank-material-shell
#		inputs.kineticwe.homeModules.default
		./sway-binds.nix
		./mango-binds.nix
		];

	nixpkgs.overlays = [
  #  		inputs.kineticwe.overlays.default
 		];

 # 	programs.kineticwe.enable = true;

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

#	programs.dank-material-shell.enable = true;

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
		eog
		qiv
		qview
		spotify
		vlc
		bitwig-studio
		reaper
		lmms
		qtractor
		muse
		gnomeExtensions.paperwm
		gnomeExtensions.dash2dock-lite
		gnomeExtensions.bing-wallpaper-changer
		simplex-chat-desktop
		qt6Packages.qt6ct
		libsForQt5.qtstyleplugin-kvantum
		pkgs.xwayland-satellite
		davinci-resolve
		avidemux
		steam
		];

	programs.home-manager.enable = true;

	programs.fish = {
		enable = true;
		};

}

	
