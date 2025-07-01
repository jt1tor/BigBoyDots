{ config, pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "chili";
    package = pkgs.kdePackages.sddm;
  };
}
