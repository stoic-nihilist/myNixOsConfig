# tint2.nix
{ pkgs, ... }:
{
  home.packages = [ pkgs.tint2 ];

  xdg.configFile."tint2/tint2rc".text = ''
    # ---- Backgrounds ----
    # 1: panel
    rounded = 14
    border_width = 1
    border_sides = TBLR
    background_color = #1e1e2e 92
    border_color = #313244 100
    background_color_hover = #1e1e2e 92
    border_color_hover = #313244 100
    background_color_pressed = #1e1e2e 92
    border_color_pressed = #313244 100

    # 2: task (normal)
    rounded = 10
    border_width = 0
    border_sides = TBLR
    background_color = #313244 0
    border_color = #313244 0
    background_color_hover = #45475a 100
    border_color_hover = #45475a 100
    background_color_pressed = #45475a 100
    border_color_pressed = #45475a 100

    # 3: task (active)
    rounded = 10
    border_width = 0
    border_sides = TBLR
    background_color = #89b4fa 100
    border_color = #89b4fa 100
    background_color_hover = #89b4fa 100
    border_color_hover = #89b4fa 100
    background_color_pressed = #74c7ec 100
    border_color_pressed = #74c7ec 100

    # 4: task (urgent)
    rounded = 10
    border_width = 0
    border_sides = TBLR
    background_color = #f38ba8 100
    border_color = #f38ba8 100
    background_color_hover = #f38ba8 100
    border_color_hover = #f38ba8 100
    background_color_pressed = #eba0ac 100
    border_color_pressed = #eba0ac 100

    # ---- Panel ----
    panel_items = PTSCP
    panel_size = 98% 36
    panel_margin = 0 6
    panel_padding = 8 4 8
    panel_position = top center horizontal
    panel_background_id = 1
    panel_dock = 0
    panel_layer = top
    panel_monitor = all
    strut_policy = follow_size
    wm_menu = 1
    font_shadow = 0

    # ---- Taskbar ----
    taskbar_mode = single_desktop
    taskbar_padding = 0 0 4
    taskbar_background_id = 0
    taskbar_active_background_id = 0
    taskbar_name = 1
    taskbar_name_padding = 8 0
    taskbar_name_background_id = 0
    taskbar_name_active_background_id = 0
    taskbar_name_font = Sans 10
    taskbar_name_font_color = #6c7086 100
    taskbar_name_active_font_color = #89b4fa 100
    taskbar_distribute_size = 0
    taskbar_sort_order = none

    # ---- Tasks ----
    task_text = 1
    task_icon = 1
    task_centered = 0
    task_maximum_size = 180 28
    task_padding = 8 4 6
    task_font = Sans 10
    task_font_color = #cdd6f4 100
    task_active_font_color = #1e1e2e 100
    task_urgent_font_color = #1e1e2e 100
    task_iconified_font_color = #6c7086 100
    task_background_id = 2
    task_active_background_id = 3
    task_urgent_background_id = 4
    task_iconified_background_id = 2
    mouse_left = toggle_iconify
    mouse_middle = none
    mouse_right = close

    # ---- Systray ----
    systray_padding = 4 2 6
    systray_background_id = 0
    systray_sort = ascending
    systray_icon_size = 20
    systray_icon_asb = 100 0 0

    # ---- Clock ----
    time1_format = %H:%M
    time2_format = %a %d %b
    time1_font = Sans Bold 11
    time2_font = Sans 8
    clock_font_color = #cdd6f4 100
    clock_padding = 10 0
    clock_background_id = 0

    # ---- Buttons (order = order of P in panel_items) ----
    # 1st P: Whisker menu
    button = new
    button_text = ☰
    button_tooltip = Menu
    button_lclick_command = xfce4-popup-whiskermenu
    button_font = Sans 13
    button_font_color = #89b4fa 100
    button_padding = 10 0
    button_background_id = 0

    # 2nd P: power
    button = new
    button_text = ⏻
    button_tooltip = Session
    button_lclick_command = xfce4-session-logout
    button_font = Sans 13
    button_font_color = #f38ba8 100
    button_padding = 10 0
    button_background_id = 0
  '';

  xdg.configFile."autostart/tint2.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=tint2
    Exec=tint2
  '';
}
