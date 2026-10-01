{ pkgs, ... }:
let
  icon = n: "${pkgs.papirus-icon-theme}/share/icons/Papirus/64x64/apps/${n}.svg";
in {
  home.packages = [ pkgs.lavalauncher ];

  xdg.configFile."lavalauncher/lavalauncher.conf".text = ''
    global-settings {
      watch-config-file = true;
    }

    bar {
      position = bottom;
      alignment = center;
      layer = top;
      mode = default;
      size = 56;
      icon-padding = 8;
      margin = 0 0 8 0;
      radius = 14;
      background-colour = "#1e1e2eee";

      button {
        image-path = ${icon "helium"};
        command[mouse-left] = helium;
      }
      button {
        image-path = ${icon "ghostty"};
        command[mouse-left] = ghostty;
      }
      button {
        image-path = ${icon "nautilus"};
        command[mouse-left] = nautilus;
      }
    }
  '';

  systemd.user.services.lavalauncher = {
    Unit = {
      Description = "lavalauncher dock";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.lavalauncher}/bin/lavalauncher";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };
}
