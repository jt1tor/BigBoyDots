{ config, pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.sddm-chili-theme;
  };
}
