# tint2.nix
{ pkgs, lib, ... }:
let
  # Soft shadow + blur behind the bar. Turns off xfwm4's own compositor.
  # Set to false if it feels heavy on the iGPU.
  useBlur = true;
in
{
  home.packages = with pkgs; [ tint2 rofi inter nerd-fonts.symbols-only ];

  services.picom = lib.mkIf useBlur {
    enable = true;
    backend = "glx";
    fade = true;
    fadeDelta = 4;
    shadow = true;
    shadowOpacity = 0.3;
    settings = {
      blur = { method = "dual_kawase"; strength = 5; };
      blur-background-exclude = [ "!class_g = 'Tint2'" ]; # blur only the bar
    };
  };

  xfconf.settings = {
    xfwm4 = {
      "general/use_compositing" = !useBlur;
      "general/workspace_names" = [ "1" "2" "3" "4" "5" "6" "7" ];
    };
    xfce4-session."general/SaveOnExit" = false;
  };

  xdg.configFile."tint2/tint2rc".text = ''
    # ================= Backgrounds (all square) =================
    # 1: panel (full width, hairline under it)
    rounded = 0
    border_width = 1
    border_sides = B
    background_color = #1e1e2e 94
    border_color = #313244 100
    background_color_hover = #1e1e2e 94
    border_color_hover = #313244 100
    background_color_pressed = #1e1e2e 94
    border_color_pressed = #313244 100

    # 2: task (normal)
    rounded = 0
    border_width = 0
    border_sides = B
    background_color = #313244 0
    border_color = #313244 0
    background_color_hover = #313244 100
    border_color_hover = #313244 100
    background_color_pressed = #45475a 100
    border_color_pressed = #45475a 100

    # 3: task (active): raised tile with accent underline
    rounded = 0
    border_width = 2
    border_sides = B
    background_color = #313244 100
    border_color = #89b4fa 100
    background_color_hover = #45475a 100
    border_color_hover = #89b4fa 100
    background_color_pressed = #45475a 100
    border_color_pressed = #74c7ec 100

    # 4: task (urgent)
    rounded = 0
    border_width = 2
    border_sides = B
    background_color = #313244 100
    border_color = #f38ba8 100
    background_color_hover = #45475a 100
    border_color_hover = #f38ba8 100
    background_color_pressed = #45475a 100
    border_color_pressed = #eba0ac 100

    # 5: workspace label (normal) / buttons
    rounded = 0
    border_width = 0
    border_sides = B
    background_color = #313244 0
    border_color = #313244 0
    background_color_hover = #313244 100
    border_color_hover = #313244 100
    background_color_pressed = #45475a 100
    border_color_pressed = #45475a 100

    # 6: workspace label (active)
    rounded = 0
    border_width = 2
    border_sides = B
    background_color = #313244 100
    border_color = #89b4fa 100
    background_color_hover = #45475a 100
    border_color_hover = #89b4fa 100
    background_color_pressed = #45475a 100
    border_color_pressed = #74c7ec 100

    # ================= Panel =================
    panel_items = PTSCP
    panel_size = 100% 38
    panel_margin = 0 0
    panel_padding = 8 0 8
    panel_position = top center horizontal
    panel_background_id = 1
    panel_dock = 0
    panel_layer = top
    panel_monitor = all
    strut_policy = follow_size
    wm_menu = 1
    font_shadow = 0

    # ================= Taskbar =================
    taskbar_mode = multi_desktop
    taskbar_padding = 0 0 4
    taskbar_background_id = 0
    taskbar_active_background_id = 0
    taskbar_name = 1
    taskbar_name_padding = 12 0
    taskbar_name_background_id = 5
    taskbar_name_active_background_id = 6
    taskbar_name_font = Inter Bold 10
    taskbar_name_font_color = #6c7086 100
    taskbar_name_active_font_color = #cdd6f4 100
    taskbar_distribute_size = 0
    taskbar_sort_order = none

    # ================= Tasks =================
    task_text = 1
    task_icon = 1
    task_centered = 0
    task_maximum_size = 170 38
    task_padding = 10 0 8
    task_font = Inter 10
    task_font_color = #a6adc8 100
    task_active_font_color = #cdd6f4 100
    task_urgent_font_color = #cdd6f4 100
    task_iconified_font_color = #6c7086 100
    task_icon_asb = 100 0 0
    task_active_icon_asb = 100 0 0
    task_iconified_icon_asb = 60 0 0
    task_background_id = 2
    task_active_background_id = 3
    task_urgent_background_id = 4
    task_iconified_background_id = 2
    mouse_left = toggle_iconify
    mouse_middle = none
    mouse_right = close
    mouse_scroll_up = desktop_left
    mouse_scroll_down = desktop_right

    # ================= Systray =================
    systray_padding = 8 0 8
    systray_background_id = 0
    systray_sort = ascending
    systray_icon_size = 20
    systray_icon_asb = 100 0 0

    # ================= Clock =================
    time1_format = %H:%M
    time2_format = %a %d %b
    time1_font = Inter Bold 11
    time2_font = Inter 8
    clock_font_color = #cdd6f4 100
    clock_padding = 12 0
    clock_background_id = 0

    # ================= Buttons (order = order of P) =================
    # 1st P: launcher (XFCE mouse)
    button = new
    button_icon = org.xfce.panel.whiskermenu
    button_tooltip = Applications
    button_lclick_command = rofi -show drun
    button_padding = 10 0
    button_background_id = 5

    # 2nd P: session (single muted glyph, no colour)
    button = new
    button_text = ⏻
    button_font = Symbols Nerd Font 12
    button_font_color = #a6adc8 100
    button_tooltip = Session
    button_lclick_command = xfce4-session-logout
    button_padding = 12 0
    button_background_id = 5
  '';
}
