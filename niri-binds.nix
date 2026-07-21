{ config, pkgs, ... }:

{
	# Writes ~/.config/niri/niri-binds.kdl
	# config.kdl itself is not managed by Home Manager here - add this line
	# at the top level of config.kdl (after the main `binds { ... }` block,
	# so these binds take priority on any overlap) to load it:
	#   include "niri-binds.kdl"
	xdg.configFile."niri/niri-binds.kdl".source = ./niri-binds.kdl;
}
