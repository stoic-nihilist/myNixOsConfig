{ pkgs, config, ... }:
let
  gtkTheme = pkgs.catppuccin-gtk.override {
    variant = "mocha";
    accents = [ "mauve" ];
    size = "standard";
    tweaks = [ "normal" ];   # add "rimless" / "black" if wanted
  };
  themeName = "catppuccin-mocha-mauve-standard";
in
{
  home.packages = with pkgs; [
    gnome-tweaks
    gnomeExtensions.user-themes
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
  ];

  gtk = {
    enable = true;
    theme = { name = themeName; package = gtkTheme; };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.catppuccin-papirus-folders.override {
        flavor = "mocha";
        accent = "mauve";
      };
    };
    cursorTheme = {
      name = "catppuccin-mocha-mauve-cursors";
      package = pkgs.catppuccin-cursors.mochaMauve;
    };
  };

  # libadwaita / GTK4 apps
  xdg.configFile = {
    "gtk-4.0/gtk.css".source = "${gtkTheme}/share/themes/${themeName}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${gtkTheme}/share/themes/${themeName}/gtk-4.0/gtk-dark.css";
    "gtk-4.0/assets".source = "${gtkTheme}/share/themes/${themeName}/gtk-4.0/assets";
  };

  dconf.settings = {
    "org/gnome/desktop/interface".color-scheme = "prefer-dark";
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "blur-my-shell@aunetx"
        "dash-to-dock@micxgx.gmail.com"
      ];
    };
    "org/gnome/shell/extensions/user-theme".name = themeName;
  };
}
