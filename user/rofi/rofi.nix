{ config, pkgs, lib, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    modes = [
      "drun"
    ];
    font = lib.mkForce "Intel One Mono 12";
  };
}
