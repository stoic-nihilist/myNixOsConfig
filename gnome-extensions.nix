{ pkgs, ... }: {
  home.packages = with pkgs.gnomeExtensions; [
    forge
    dash2dock-lite
    ddterm
    blur-my-shell
#    gnome-clocks
#    paperwm
  ];

  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    disable-extension-version-validation = true;
    enabled-extensions = with pkgs.gnomeExtensions; [
      forge.extensionUuid
      dash2dock-lite.extensionUuid
    ];
  };
}
