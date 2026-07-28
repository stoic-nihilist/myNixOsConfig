{ config, pkgs, inputs, ... }:

{

         # Allow unfree packages
         nixpkgs.config.allowUnfree = true;

	imports = [
		./hypr-binds.nix
		./hypr-settings.nix
		./niri-binds.nix
		inputs.noctalia.homeModules.default
		./sway-binds.nix
		./mango-binds.nix
		./hypr-scrolling.nix
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

	wayland.windowManager.hyprland = {
		enable = true;
		package = null;        # use the Hyprland from your NixOS `programs.hyprland.enable`, not a second copy
		portalPackage = null;  # same, for the xdg-desktop-portal
		plugins = [
			inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprscrolling
			];
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
		];

	programs.home-manager.enable = true;

	programs.fish = {
		enable = true;
		};		

	qt = {
  enable = true;
  platformTheme.name = "qtct";
  style.name = "kvantum";
};

home.sessionVariables = {
  XDG_CURRENT_DESKTOP = "niri";
  GDK_BACKEND = "wayland,x11";
  QT_QPA_PLATFORM = "wayland";
};


}

	
