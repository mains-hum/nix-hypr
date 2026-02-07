{
  config,
  pkgs,
  lib,
  colors,
  ...
}:

let
  cleanHex = c: lib.removePrefix "#" c;
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
      "$bg" = "rgb(${cleanHex colors.palette.bg})";
      "$fg" = "rgb(${cleanHex colors.palette.fg})";
      "$red" = "rgb(${cleanHex colors.palette.red})";
      "$green" = "rgb(${cleanHex colors.palette.green})";
      "$yellow" = "rgb(${cleanHex colors.palette.yellow})";
      "$blue" = "rgb(${cleanHex colors.palette.blue})";
      "$magenta" = "rgb(${cleanHex colors.palette.magenta})";
      "$cyan" = "rgb(${cleanHex colors.palette.cyan})";
      "$lavender" = "rgb(${cleanHex colors.palette.lavender})";

      "$mainMod" = "MOD3";
      "$screenshot" = "grim -g \"$(slurp)\" ~/Pictures/screenshot.png";
      "$browser" = "firefox";
      "$launcher" = "fuzzel";
      "$swww" = "swww-daemon";
      "$autoswww" = "swww img ~/Wallpaper/5.* --transition-type none";
      "$volum" = "wpctl set-volume @DEFAULT_AUDIO_SINK@";
      "$mute" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

      monitor = [
        "DP-2, 1920x1080@60, -1920x540, 1"
        "HDMI-A-1, 1920x1080@99, -1920x-540, 1"
        "DP-1, 1920x1080@165, 0x0, 1"
      ];

      workspace = [
        "1, monitor:DP-2, default:true"
        "2, monitor:HDMI-A-1, default:true"
        "3, monitor:DP-1, default:true"
      ];

      env = [
        "XCURSOR_THEME, phinger-cursors-dark"
        "XCURSOR_SIZE, 24"
      ];

      cursor = {
        inactive_timeout = 2;
      };

      "exec-once" = [
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "$swww & $autoswww"
        "waybar"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(${cleanHex colors.palette.cyan}ee)";
      };

      decoration = {
        rounding = 0;
        active_opacity = 0.95;
        inactive_opacity = 0.90;
        fullscreen_opacity = 1.0;

        shadow = {
          enabled = false;
        };

        blur = {
          enabled = true;
          size = 8;
          passes = 3;
          new_optimizations = true;
          ignore_opacity = true;
          noise = 0.02;
        };
      };

      animations = {
        enabled = false;
      };

      input = {
        kb_layout = "us,ru";
        kb_options = "caps:hyper";
        follow_mouse = 1;
      };

      bind = [
        "$mainMod, SPACE, exec, hyprctl switchxkblayout all next"
        "$mainMod, Q, killactive"
        "$mainMod, G, togglefloating"
        "$mainMod, F, fullscreen"

        "$mainMod, E, exec, foot"
        "$mainMod, RETURN, exec, foot"
        "$mainMod, R, exec, $launcher"
        "$mainMod, W, exec, $browser"
        "$mainMod, D, exec, Telegram"
        "ALT SHIFT, S, exec, $screenshot"
        "$mainMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"

        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"

        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, l, movewindow, r"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, j, movewindow, d"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        ", XF86AudioRaiseVolume, exec, $volum 5%+"
        ", XF86AudioLowerVolume, exec, $volum 5%-"
        ", XF86AudioMute, exec, $mute"
      ];

      binde = [
        "$mainMod CTRL, h, resizeactive, -50 0"
        "$mainMod CTRL, l, resizeactive, 50 0"
        "$mainMod CTRL, k, resizeactive, 0 -50"
        "$mainMod CTRL, j, resizeactive, 0 50"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
