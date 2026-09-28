services.polybar = {
  enable = true;
  package = pkgs.polybar.override { pulseSupport = true; };
  script = "polybar main &";
  settings = {
    "colors" = {
      bg = "#eb1e1e2e";       # ARGB, ~92% opaque
      fg = "#cdd6f4";
      accent = "#89b4fa";
      border = "#313244";
    };

    "bar/main" = {
      width = "98%";
      height = 32;
      offset-x = "1%";
      offset-y = 6;           # floating gap from top
      radius = 14;            # rounded corners
      border-size = 1;
      border-color = "\${colors.border}";
      background = "\${colors.bg}";
      foreground = "\${colors.fg}";
      padding = 2;
      module-margin = 1;
      font-0 = "monospace:size=11;2";
      modules-left = "xworkspaces";
      modules-center = "date";
      modules-right = "pulseaudio network";
      tray-position = "right";
      enable-ipc = true;
    };

    "module/xworkspaces" = {
      type = "internal/xworkspaces";
      label-active = "%name%";
      label-active-background = "\${colors.accent}";
      label-active-foreground = "#1e1e2e";
      label-active-padding = 1;
      label-occupied-padding = 1;
    };
    "module/date" = {
      type = "internal/date";
      date = "%H:%M";
    };
    "module/pulseaudio" = {
      type = "internal/pulseaudio";
      format-volume = "vol <label-volume>";
    };
    "module/network" = {
      type = "internal/network";
      interface-type = "wireless";
      label-connected = "%essid%";
    };
  };
};
