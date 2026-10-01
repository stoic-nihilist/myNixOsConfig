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
        image-path = ${icon "firefox"};
        command[mouse-left] = firefox;
      }
      button {
        image-path = ${icon "utilities-terminal"};
        command[mouse-left] = foot;
      }
      button {
        image-path = ${icon "system-file-manager"};
        command[mouse-left] = thunar;
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
