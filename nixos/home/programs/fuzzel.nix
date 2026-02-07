{
  config,
  pkgs,
  lib,
  colors,
  ...
}:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce "JetBrainsMono Nerd Font:size=12";
        prompt = "❯   ";
        width = 30;
        horizontal-pad = 20;
        vertical-pad = 15;
        inner-pad = 10;
        line-height = 25;
        terminal = "foot";
        show-icons = "yes";
        icon-theme = "Papirus-Dark";
        filter-always = "yes";
      };

      colors = lib.mkForce {
        background = "${lib.removePrefix "#" colors.palette.bg}ff";
        text = "${lib.removePrefix "#" colors.palette.fg}ff";
        match = "${lib.removePrefix "#" colors.palette.yellow}ff";
        selection = "${lib.removePrefix "#" colors.palette.surface1}ff";
        selection-text = "${lib.removePrefix "#" colors.palette.fg}ff";
        selection-match = "${lib.removePrefix "#" colors.palette.yellow}ff";
        border = "${lib.removePrefix "#" colors.palette.magenta}ff";
      };

      border = {
        width = 2;
        radius = 0;
      };
    };
  };
}
