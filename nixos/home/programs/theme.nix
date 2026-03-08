{
  config,
  pkgs,
  lib,
  colors,
  ...
}:

{
  gtk = {
    enable = true;

    theme = {
      name = "adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    cursorTheme = {
      name = "phinger-cursors-dark";
      package = pkgs.phinger-cursors;
      size = 24;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 11;
    };

    gtk3.extraCss = ''
      @define-color accent_color ${colors.palette.blue};
      @define-color window_bg_color ${colors.palette.bg};
      @define-color window_fg_color ${colors.palette.fg};
      @define-color view_bg_color ${colors.palette.bg};
      @define-color view_fg_color ${colors.palette.fg};
      @define-color headerbar_bg_color ${colors.palette.bg};
      @define-color headerbar_fg_color ${colors.palette.fg};
      @define-color card_bg_color ${colors.palette.bg};
      @define-color sidebar_bg_color ${colors.palette.bg};
      @define-color sidebar_fg_color ${colors.palette.fg};
      @define-color secondary_sidebar_bg_color ${colors.palette.bg};
    '';

    gtk4.extraCss = ''
      @define-color accent_color ${colors.palette.blue};
      @define-color window_bg_color ${colors.palette.bg};
      @define-color window_fg_color ${colors.palette.fg};
      @define-color view_bg_color ${colors.palette.bg};
      @define-color view_fg_color ${colors.palette.fg};
      @define-color headerbar_bg_color ${colors.palette.bg};
      @define-color headerbar_fg_color ${colors.palette.fg};
      @define-color card_bg_color ${colors.palette.bg};
      @define-color sidebar_bg_color ${colors.palette.bg};
      @define-color sidebar_fg_color ${colors.palette.fg};
      @define-color secondary_sidebar_bg_color ${colors.palette.bg};
    '';

    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "adwaita-dark";
  };

  home.sessionVariables = {
    GTK_THEME = "adwaita-dark";
    ADW_DISABLE_PORTAL = "1";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "adwaita-dark";
      icon-theme = "Papirus-Dark";
      cursor-theme = "phinger-cursors-dark";
      cursor-size = 24;
      font-name = "JetBrainsMono Nerd Font 11";
    };
    "com/github/johnfactotum/Foliate" = {
      theme = "dark";
      font = "JetBrainsMono Nerd Font 12";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "phinger-cursors-dark";
    package = pkgs.phinger-cursors;
    size = 24;
  };

  home.packages = with pkgs; [
    gnome-themes-extra
    papirus-icon-theme
    phinger-cursors
    lxappearance
  ];
}
