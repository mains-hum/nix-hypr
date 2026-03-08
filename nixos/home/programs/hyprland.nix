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
      "$screenshot" = "grim -g \"$(slurp)\" ~/Screenshots/screenshot.png";
      "$browser" = "librewolf";
      "$launcher" = "fuzzel";
      "$swww" = "swww-daemon";
      "$autoswww" = "swww img ~/Wallpaper/2.* --transition-type none";
      "$volum" = "wpctl set-volume @DEFAULT_AUDIO_SINK@";
      "$mute" = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

      monitor = [
        "DP-1, 1920x1080@165, 0x0, 1"
        "HDMI-A-1, 1920x1080@99, 1920x-800, 1, transform, 3"
      ];

      workspace = [
        "1, monitor:DP-1, default:true"
        "4, monitor:HDMI-A-1, default:true"
      ];

      env = [
        "XCURSOR_THEME, phinger-cursors-dark"
        "XCURSOR_SIZE, 24"
      ];

      cursor = {
        inactive_timeout = 1;
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
        border_size = 3;
        "col.active_border" = "rgba(8ba4b0aa)";
        "col.inactive_border" = "rgba(0f0f0faa)";
      };

      decoration = {
        rounding = 0;
        active_opacity = 0.95;
        inactive_opacity = 0.95;
        fullscreen_opacity = 1.0;

        shadow = {
          enabled = true;
        };

        blur = {
          enabled = true;
          size = 4;
          passes = 2;
          new_optimizations = true;
          ignore_opacity = true;
          noise = 0.05;
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "main, 0.15, 1, 0.3, 1"
          "fast, 0.1, 1, 0.1, 1"
          "overshot, 0.05, 0.9, 0.1, 1.05"
        ];
        animation = [
          "windows, 1, 3, overshot, slide"
          "windowsOut, 1, 3, fast, slide"
          "windowsMove, 1, 3, main"
          "fade, 1, 3, main"
          "workspaces, 1, 3.5, overshot, slide"
          "specialWorkspace, 1, 3, main, slidevert"
        ];
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
        "$mainMod, k, exec, export http_proxy=http://127.0.0.1:1081; export https_proxy=http://127.0.0.1:1081; discord"

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
