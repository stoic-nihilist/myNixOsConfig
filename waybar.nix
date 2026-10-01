{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      top = {
        layer = "top";
        position = "top";
        height = 30;

        modules-left = [ "dwl/tags" "dwl/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "pulseaudio" "network" "battery" "tray" ];

        "dwl/tags" = { num-tags = 9; };
        "dwl/window" = { format = "{title}"; max-length = 60; };
        clock = { format = "{:%a %d %b  %H:%M}"; };
        pulseaudio = { format = "vol {volume}%"; format-muted = "muted"; };
        network = {
          format-wifi = "{essid}";
          format-ethernet = "eth";
          format-disconnected = "offline";
        };
        battery = { format = "bat {capacity}%"; };
        tray = { spacing = 8; };
      };
    };

    style = ''
      * { font-family: sans-serif; font-size: 13px; border: none; min-height: 0; }
      window#waybar { background: #1e1e2e; color: #cdd6f4; }
      #tags button { padding: 0 8px; color: #6c7086; background: transparent; }
      #tags button.occupied { color: #cdd6f4; }
      #tags button.focused { background: #cba6f7; color: #1e1e2e; }
      #tags button.urgent { background: #f38ba8; color: #1e1e2e; }
      #clock, #pulseaudio, #network, #battery, #tray { padding: 0 10px; }
    '';
  };
}
