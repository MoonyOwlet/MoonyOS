{
  config,
  lib,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    env = [
      "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
      "XDG_SESSION_TYPE, wayland"
      # "WLR_RENDERER_ALLOW_SOFTWARE, 1"
    ];

    exec-once = [
      "waybar"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "${lib.getExe pkgs.hyprland-per-window-layout}"
      "vesktop"
      "ayugram-desktop"
      "thunderbird"
      "pypr"
    ];

    general = {
      border_size = 2;
      gaps_in = 5;
      gaps_out = 10;
      "col.inactive_border" = "$surface1";
      "col.active_border" = "$accent";
      layout = "dwindle";
      allow_tearing = false;
    };

    decoration = {
      rounding = 10;
      active_opacity = 0.99;
      inactive_opacity = 0.95;
      blur = {
        enabled = true;
        size = 7;
        passes = 2;
        popups = true;
      };
      shadow = {
        enabled = true;
        range = 7;
        color = "$accent";
        color_inactive = "$base";
      };
    };

    animations = {
      enabled = true;
      "bezier" = "myBezier, 0.05, 0.9, 0.1, 1.05";
      animation = [
        "windows, 1, 7, myBezier"
        "windowsOut, 1, 7, default, popin 80%"
        "border, 1, 10, default"
        "borderangle, 1, 8, default"
        "fade, 1, 7, default"
        "workspaces, 1, 6, default"
      ];
    };

    input = {
      kb_layout = "us, ru";
      kb_options = "grp:win_space_toggle";
      numlock_by_default = true;
      touchpad = {
        disable_while_typing = false;
        scroll_factor = 0.5;
        middle_button_emulation = true;
      };
    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_forever = true;
    };

    group = {
      "col.border_active" = "$accent";
      "col.border_inactive" = "$base";
      "col.border_locked_active" = "rgba(${config.theme.colors.notable.accent}ff)";
      "col.border_locked_inactive" = "rgba(${config.theme.colors.notable.text}ff)";
      groupbar = {
        text_color = "$text";
        "col.active" = "rgba(${config.theme.colors.base}aa)";
        "col.inactive" = "rgba(${config.theme.colors.surface0}aa)";
        "col.locked_active" = "rgba(${config.theme.colors.notable.text}aa)";
        "col.locked_inactive" = "rgba(${config.theme.colors.notable.subtext1}aa)";
      };
    };

    misc = {
      disable_hyprland_logo = true;
      disable_splash_rendering = false;
      font_family = "JetBrainsMono Nerd Font";
      force_default_wallpaper = 0;
      mouse_move_enables_dpms = true;
      key_press_enables_dpms = true;
      animate_manual_resizes = true;
      animate_mouse_windowdragging = true;
      focus_on_activate = false;
      allow_session_lock_restore = true;
      background_color = "$base";
    };

    xwayland.force_zero_scaling = true;

    render.direct_scanout = true;

    debug.disable_logs = false;

    dwindle.smart_resizing = true;
  };
}
