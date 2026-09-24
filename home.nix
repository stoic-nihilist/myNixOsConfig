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
		inputs.kineticwe.homeModules.default
		inputs.ags.homeManagerModules.default
		./sway-binds.nix
		./mango-binds.nix
		];

	nixpkgs.overlays = [
    		inputs.kineticwe.overlays.default
		(final: prev: {
    			noctalia = prev.noctalia.overrideAttrs (o: {
      				buildInputs = (o.buildInputs or []) ++ [ final.curl.dev ];
      				nativeBuildInputs = (o.nativeBuildInputs or []) ++ [ final.pkg-config ];
    				});
  			})
		(final: prev: {
  			noctalia = inputs.noctalia.packages.${final.stdenv.hostPlatform.system}.default.overrideAttrs (o: {
    				buildInputs = (o.buildInputs or []) ++ [ final.curl.dev ];
  				});
			})
 		];

#  	programs.kineticwe.enable = true;

#	xdg.configFile."autostart/guake.desktop".source = "${pkgs.guake}/share/applications/guake.desktop";

	programs.ags.enable = true;

	programs.noctalia = {
#		enable = true;

		settings = {
			theme = {
#				mode = "dark";
#				source = "builtin";
#				builtin = "Catppuccin";
				};

			wallpaper = {
#				enabled = true;
#				default.path = "./forest.jpg";
				};
			};
		};

#	programs.dank-material-shell.enable = true;

	home.username = "jeffreyyyy";
	home.homeDirectory = "/home/jeffreyyyy";
	home.stateVersion = "26.05";
	
#	programs.yakuake.enable = true;


	home.packages = with pkgs; [
		ripgrep
		curl
		fastfetch
		mailspring
		inputs.localwp.packages.${pkgs.system}.default
		nautilus
		glib
		pkg-config
		git
		fragments
		howdy
		vscodium
		gcc
		onlyoffice-desktopeditors
		kdePackages.yakuake
		opencode
		aria2
		tilda
		plank
		steam
		gnumake
		cmake
		helium
		kitty
		gjs
		cmake
#		pkgconfig
#		libcurl
#		guake
		git-credential-manager
		fish
		bottles
		file
		emacsPackages.mu4e
		whatsapp-electron
		fish
		parabolic
#		wine64
		wineWow64Packages.stable
		meson
#		opencode
		speedtest-cli
		spotdl
		gallery-dl
		gopeed
		kdePackages.dolphin
		gnome-disk-utility
		unzip
		kdePackages.ark
#		wine 
		winetricks
		localsend
		telegram-desktop
		eog
		qiv
		qview	
		spotify
		vlc
		distrobox
		bitwig-studio
		reaper
		lmms
		qtractor
		muse
		gnomeExtensions.paperwm
		gnomeExtensions.dash2dock-lite
		notes
		sticky-notes
		gnomeExtensions.bing-wallpaper-changer
		simplex-chat-desktop
		qt6Packages.qt6ct
		libsForQt5.qtstyleplugin-kvantum
		pkgs.xwayland-satellite
		dnf5
		rpm
		dpkg
		avidemux
		thunderbird
		];

	programs.home-manager.enable = true;

	programs.fish = {
		enable = true;
		};

	programs.ghostty.enable = true;

}

	
