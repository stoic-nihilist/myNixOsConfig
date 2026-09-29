{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    catppuccin-gtk
    papirus-icon-theme
    bibata-cursors
  ];

  gtk = {
    enable = true;

    theme = {
      name = "Catppuccin-Frappe-Standard-Pink-Dark";
      package = pkgs.catppuccin-gtk;
    };

    iconTheme = {
      name = "Papirus-Light";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 0;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 0;
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "Catppuccin-Frappe-Standard-Pink-Dark";
      icon-theme = "Papirus-Light";
      cursor-theme = "Bibata-Modern-Ice";
      cursor-size = 24;
      color-scheme = "prefer-dark";
    };
  };
}
