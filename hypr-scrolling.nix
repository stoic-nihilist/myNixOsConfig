{ config, pkgs, inputs, ... }:

let
	hyprscrolling = inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprscrolling;
	in
{
	# Writes ~/.config/hypr/hypr-scrolling.lua, with the real Nix store path
	# to the plugin baked in at build time (plain xdg.configFile text can't
	# interpolate this, so it's generated here instead).
	xdg.configFile."hypr/hypr-scrolling.lua".text = ''
		-- Loads the Nix-built hyprscrolling plugin (niri-style scrolling layout).
		-- Required from hyprland.lua via: require("hypr-scrolling")
		-- Managed by Home Manager - do not edit directly.

		hl.exec_cmd("hyprctl plugin load ${hyprscrolling}/lib/libhyprscrolling.so")

		hl.config({
			general = {
				layout = "scrolling",
			},
		})

		hl.config({
			plugin = {
				hyprscrolling = {
					column_width = 0.7,
					fullscreen_on_one_column = false,
				},
			},
		})
	'';
}
