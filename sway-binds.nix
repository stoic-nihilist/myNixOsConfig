{ config, pkgs, ... }:

{
	# Writes ~/.config/sway/sway-binds
	# Your main sway config (~/.config/sway/config, however you're managing
	# it - symlink or xdg.configFile) needs one line added to load this:
	#   include ~/.config/sway/sway-binds
	xdg.configFile."sway/sway-binds".source = ./sway-binds;
}
