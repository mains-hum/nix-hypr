{
  pkgs,
  lib,
  colors,
  ...
}:

let
  noHash = color: lib.removePrefix "#" color;
in
{
  home.packages = [ pkgs.noctalia-shell ];

  xdg.configFile."noctalia/colors.json".text = builtins.toJSON {
    "mError" = colors.palette.red;
    "mHover" = colors.palette.blue;
    "mOnError" = colors.palette.bg;
    "mOnHover" = colors.palette.bg;
    "mOnPrimary" = colors.palette.bg;
    "mOnSecondary" = colors.palette.bg;
    "mOnSurface" = colors.palette.fg;
    "mOnSurfaceVariant" = colors.palette.overlay0;
    "mOnTertiary" = colors.palette.bg;
    "mOutline" = colors.palette.surface2;
    "mPrimary" = colors.palette.magenta;
    "mSecondary" = colors.palette.lavender;
    "mShadow" = "#000000";
    "mSurface" = colors.palette.bg;
    "mSurfaceVariant" = colors.palette.surface0;
    "mTertiary" = colors.palette.cyan;
  };

  xdg.configFile."noctalia/config.toml".text = ''
    [profile]
    name = "nixos_tree_setup"

    [[left]]
    type = "dir"
    style = "bold fg:${noHash colors.palette.blue}"

    [[left]]
    type = "git"
    style = "fg:${noHash colors.palette.green}"

    [[left]]
    type = "status"
    style = "fg:${noHash colors.palette.red}"

    [[right]]
    type = "time"
    format = "%H:%M"
    style = "fg:${noHash colors.palette.fg}" 
  '';
}
