{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    foliate
  ];

  dconf.settings = {
    "com/github/johnfactotum/Foliate" = {
      font = "JetBrainsMono Nerd Font 12";
      theme = "dark";
    };
  };
}
