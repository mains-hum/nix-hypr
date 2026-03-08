{
  config,
  pkgs,
  lib,
  colors,
  ...
}:

let
  noHash = color: lib.removePrefix "#" color;
in
{
  programs.foot = {
    enable = true;
    server.enable = true;

    settings = {
      main = {
        shell = "${pkgs.nushell}/bin/nu";
        font = "JetBrainsMono Nerd Font:style=Bold:size=13";
        pad = "0x0";
      };

      colors = {
        foreground = noHash colors.palette.fg;
        background = noHash colors.palette.bg;

        cursor = "${noHash colors.palette.bg} ${noHash colors.palette.rosewater}";

        selection-foreground = noHash colors.palette.fg;
        selection-background = noHash colors.palette.surface2;

        urls = noHash colors.palette.cyan;

        regular0 = noHash colors.palette.black;
        bright0 = noHash colors.palette.bright_black;
        regular1 = noHash colors.palette.red;
        bright1 = noHash colors.palette.red;
        regular2 = noHash colors.palette.green;
        bright2 = noHash colors.palette.green;
        regular3 = noHash colors.palette.yellow;
        bright3 = noHash colors.palette.yellow;
        regular4 = noHash colors.palette.blue;
        bright4 = noHash colors.palette.blue;
        regular5 = noHash colors.palette.magenta;
        bright5 = noHash colors.palette.magenta;
        regular6 = noHash colors.palette.cyan;
        bright6 = noHash colors.palette.cyan;
        regular7 = noHash colors.palette.fg;
        bright7 = noHash colors.palette.white;
      };
    };
  };
}
