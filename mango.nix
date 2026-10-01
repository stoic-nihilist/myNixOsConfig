{ config, pkgs, ... }:

{
	# Writes ~/.config/mango/mango-binds.conf
	# Your main mango config (~/.config/mango/config.conf) needs one line
	# added to load this:
	#   source=~/.config/mango/mango-binds.conf
	xdg.configFile."mango/mango.conf".source = ./mango.conf;

	xdg.configFile."mangobar/style.css".text = ''
	 @define-color bg      #1e1e2e;
	 @define-color surface #313244;
	 @define-color accent  #ebc41a;
	 @define-color text    #0a0c12;
	 @define-color dim     #6c7086;
	 
	 * {
	   font-family: sans-serif;
	   font-size: 11px;
	   font-weight: bold;
	   color: @text;
	   background: none;
	   background-color: #ebc41a;
	 }
	 
	 #workspaces, #layout, #cpu, #memory, #clock {
	   background: linear-gradient(to bottom, @surface, mix(@surface, @bg, 0.45));
	   border-radius: -1;
	   padding-left: 12px;
	   padding-right: 12px;
	   margin-top: 3px;
	   margin-bottom: 3px;
	   margin-left: 4px;
	   margin-right: 4px;
	 }
	 
	 #workspaces button { color: @dim; padding: 0 6px; }
	 #workspaces button.active {
	   background: linear-gradient(to bottom, @accent, mix(@accent, @bg, 0.35));
	   color: @bg;
	   border-radius: -1;
	 }
	 
	 #window { color: @dim; padding-left: 8px; }
	'';


	services.mangobar = {
#	  enable = true;
	
#	  systemdTarget = "mango.target";
	
	  settings = {
	    modules-left = [
	      "workspaces"
	      "layout"
	      "window"
	    ];
	
	    modules-right = [
	      "cpu"
	      "memory"
	      "clock#time"
	    ];
	  };
	};
}
