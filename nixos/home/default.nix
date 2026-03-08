{
  config,
  pkgs,
  lib,
  ...
}:

let
  colors = import ./colors.nix;
in
{
  _module.args = { inherit colors; };

  imports = [
    ./programs/waybar.nix
    ./programs/zellij.nix
    ./programs/nushell.nix
    ./packages.nix
    ./programs/foot.nix
    ./img.nix
    ./programs/foliate.nix
    ./programs/helix.nix
    ./programs/fuzzel.nix
    ./programs/gowall.nix
    ./programs/git.nix
    ./programs/cava.nix
    ./programs/theme.nix
    ./programs/fastfetch.nix
    ./programs/hyprland.nix
    # ./programs/firefox.nix
    ./programs/librewolf.nix
  ];

  home.enableNixpkgsReleaseCheck = false;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-theme = "phinger-cursors-dark";
    };
  };

  home.stateVersion = "26.05";
}
