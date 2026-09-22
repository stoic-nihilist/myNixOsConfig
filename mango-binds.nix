{ config, pkgs, ... }:

{
	# Writes ~/.config/mango/mango-binds.conf
	# Your main mango config (~/.config/mango/config.conf) needs one line
	# added to load this:
	#   source=~/.config/mango/mango-binds.conf
	xdg.configFile."mango/mango-binds.conf".source = ./mango-binds.conf;
}
