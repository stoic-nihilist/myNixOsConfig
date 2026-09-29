{ pkgs, ... }:
{
  home.packages = [ pkgs.nerd-fonts.jetbrains-mono ];
  fonts.fontconfig.enable = true;

  fonts.fontconfig.defaultFonts.monospace = [ "JetBrainsMono Nerd Font Mono" ];

  dconf.settings."org/gnome/desktop/interface".monospace-font-name =
    "JetBrainsMono Nerd Font Mono 11";

  programs.ghostty.settings = {
    font-family = "JetBrainsMono Nerd Font Mono";
    font-size = 11;
  };
}
