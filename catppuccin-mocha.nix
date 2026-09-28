{ pkgs, ... }:
let
  gtkTheme = "catppuccin-mocha-blue-standard";
in {
  gtk = {
    enable = true;
    theme = {
      name = gtkTheme;
      package = pkgs.catppuccin-gtk.override {
        variant = "mocha";
        accents = [ "blue" ];
        size = "standard";
      };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "blue";
      };
    };
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
  };

  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "catppuccin-mocha-dark-cursors";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

  # XFCE: apply via xfconf
  xfconf.settings = {
    xsettings = {
      "Net/ThemeName" = gtkTheme;
      "Net/IconThemeName" = "Papirus-Dark";
      "Gtk/CursorThemeName" = "catppuccin-mocha-dark-cursors";
    };
    xfwm4."general/theme" = gtkTheme; # window decorations (rounded corners come from the theme's xfwm4 dir)
  };
}
