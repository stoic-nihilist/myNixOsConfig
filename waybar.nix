{ config, pkgs, ... }:

{

  home.packages = [ pkgs.pavucontrol pkgs.wlogout ];
  
  programs.waybar = {
    enable = true;

    settings = {
      top = {
        layer = "top";
        position = "top";
        height = 30;

        modules-left = [ "ext/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "power-profiles-daemon" "battery" "tray" ];

        pulseaudio = {
          format = "vol {volume}%";
          format-muted = "muted";
          scroll-step = 5;
          on-click = "pavucontrol";
          on-click-right = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
        };
        
        network = {
          format-wifi = "{essid}";
          format-ethernet = "eth";
          format-disconnected = "offline";
          tooltip-format = "{ifname}: {ipaddr}  ({signalStrength}%)";
          on-click = "ghostty -e nmtui";
        };
        
        "power-profiles-daemon" = {
          format = "{icon}";
          tooltip-format = "profile: {profile}";
          format-icons = {
            default = "bal";
            performance = "perf";
            balanced = "bal";
            power-saver = "save";
          };
        };
        
        clock = {
          format = "{:%a %d %b  %H:%M}";
          format-alt = "{:%A, %d %B %Y}";
        };  

        "custom/power" = { format = "off"; on-click = "wlogout"; };  

       "ext/workspaces" = { format = "{name}"; on-click = "activate"; };
      #  clock = { format = "{:%a %d %b  %H:%M}"; };
     #   pulseaudio = { format = "vol {volume}%"; format-muted = "muted"; };
      #  network = { format-wifi = "{essid}"; format-ethernet = "eth"; format-disconnected = "offline"; };
        battery = { format = "bat {capacity}%"; };
        tray = { spacing = 8; };
      };
    };

    style = ''
      * { font-family: sans-serif; font-size: 13px; border: none; min-height: 0; }
      window#waybar { background: #1e1e2e; color: #cdd6f4; }
     #workspaces button { padding: 0 8px; color: #6c7086; background: transparent; }
     #workspaces button.active { background: #cba6f7; color: #1e1e2e; }
     #workspaces button.urgent { background: #f38ba8; color: #1e1e2e; }
      #clock, #pulseaudio, #network, #battery, #tray { padding: 0 10px; }
      #pulseaudio:hover, #network:hover, #power-profiles-daemon:hover, #clock:hover { background: #313244; }
      #power-profiles-daemon { padding: 0 10px; }
    '';
  };
}
