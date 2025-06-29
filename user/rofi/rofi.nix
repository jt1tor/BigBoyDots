{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    modes = [
      "drun"
    ];
    font = "Intel One Mono 16";
    theme = "dmenu";
  };
}
