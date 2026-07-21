{ config, pkgs, ... }:

{
	# Writes ~/.config/hypr/hypr-settings.lua
	# Add this line to hyprland.lua (after the MONITORS/INPUT sections) so it loads:
	#   require("hypr-settings")
	xdg.configFile."hypr/hypr-settings.lua".source = ./hypr-settings.lua;
}
