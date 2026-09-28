# xfce-panel.nix
{ pkgs, ... }:
{
  home.packages = with pkgs; [ inter xfce4-whiskermenu-plugin ];

  gtk.gtk3.extraCss = ''
    /* ---- bar ---- */
    .xfce4-panel.background {
      background-color: alpha(#1e1e2e, 0.94);
      border: none;
      border-bottom: 1px solid #313244;
      border-radius: 0;
      color: #cdd6f4;
      font-family: "Inter";
      font-size: 10pt;
    }

    /* ---- every panel button: flat, square ---- */
    .xfce4-panel button,
    .xfce4-panel button.flat {
      background: none;
      background-image: none;
      border: none;
      border-bottom: 2px solid transparent;
      border-radius: 0;
      box-shadow: none;
      color: #a6adc8;
      padding: 0 8px;
      min-height: 0;
    }
    .xfce4-panel button:hover {
      background-color: #313244;
    }

    /* ---- active window / checked items: raised tile + blue underline ---- */
    .xfce4-panel button:checked,
    .xfce4-panel button:active {
      background-color: #313244;
      border-bottom: 2px solid #89b4fa;
      color: #cdd6f4;
    }

    /* ---- workspace switcher ---- */
    .xfce4-panel wnck-pager {
      background-color: transparent;
      color: #6c7086;
    }
    .xfce4-panel wnck-pager:selected {
      background-color: #313244;
      border-bottom: 2px solid #89b4fa;
    }

    /* ---- clock, separators, tray ---- */
    .xfce4-panel label { color: #cdd6f4; }
    .xfce4-panel separator { background: transparent; min-width: 8px; }
  '';

  xfconf.settings = {
    xfce4-panel = {
      "panels/panel-1/background-style" = 0;   # use GTK theme
      "panels/panel-1/length" = 100;
      "panels/panel-1/length-adjust" = false;
      "panels/panel-1/size" = 38;
      "panels/panel-1/icon-size" = 20;
      "panels/panel-1/autohide-behavior" = 0;
    };
    xfwm4."general/use_compositing" = true;    # needed for the alpha background
    xfce4-session = {
      "sessions/Failsafe/Client2_Command" = [ "xfce4-panel" ];  # tint2 -> panel
      "general/SaveOnExit" = false;
    };
  };
}
