{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.hack
    noto-fonts
    mononoki
    noto-fonts-color-emoji
    font-awesome
    pavucontrol
  ];
}
