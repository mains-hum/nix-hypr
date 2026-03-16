{ pkgs, colors, ... }:

{
  programs.zellij = {
    enable = true;
    settings = {
      default_shell = "${pkgs.nushell}/bin/nu";
      theme = "ocean";
      show_startup_tips = false;
      pane_frames = false;
      simplified_ui = true;
      mouse_mode = true;
      session_serialization = true;
      copy_on_select = true;

      ui = {
        pane_frames = {
          hide_session_name = true;
        };
      };

      keybinds = {
        "shared_except \"locked\"" = {
          "bind \"Ctrl a\"" = {
            NewPane = "Down";
          };
          "bind \"Ctrl s\"" = {
            NewPane = "Right";
          };
          "bind \"Ctrl h\"" = {
            MoveFocus = "Left";
          };
          "bind \"Ctrl l\"" = {
            MoveFocus = "Right";
          };
          "bind \"Ctrl j\"" = {
            MoveFocus = "Down";
          };
          "bind \"Ctrl k\"" = {
            MoveFocus = "Up";
          };
          "bind \"Alt h\"" = {
            Resize = "Increase Left";
          };
          "bind \"Alt l\"" = {
            Resize = "Increase Right";
          };
          "bind \"Alt j\"" = {
            Resize = "Increase Down";
          };
          "bind \"Alt k\"" = {
            Resize = "Increase Up";
          };
          "bind \"Ctrl t\"" = {
            NewTab = [ ];
          };
          "bind \"Alt w\"" = {
            CloseTab = [ ];
          };
          "bind \"Alt n\"" = {
            GoToNextTab = [ ];
          };
          "bind \"Alt p\"" = {
            GoToPreviousTab = [ ];
          };
        };
      };

      themes = {
        ocean = {
          fg = "${colors.palette.fg}";
          bg = "${colors.palette.bg}";
          black = "${colors.palette.black}";
          red = "${colors.palette.red}";
          green = "${colors.palette.blue}";
          yellow = "${colors.palette.yellow}";
          blue = "${colors.palette.blue}";
          magenta = "${colors.palette.magenta}";
          cyan = "${colors.palette.cyan}";
          white = "${colors.palette.white}";
          orange = "${colors.palette.orange}";
        };
      };
    };
  };

  xdg.configFile."zellij/layouts/default.kdl".text = ''
    layout {
        default_tab_template {
            children
        }
        tab {
            pane
        }
    }
  '';
}
