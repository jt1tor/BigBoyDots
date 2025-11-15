{ config, pkgs, ... }:

{
  windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      dmenu
      i3blocks
    ];
  };
}
