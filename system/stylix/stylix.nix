{ config, pkgs, ... }:

{
  stylix = {
    enable = true;
    image = ../../wpapers/PurpleLandscape.jpg;
    polarity = "dark";
    cursor = {
      name = "Vanilla-DMZ";
      package = pkgs.vanilla-dmz;
      size = 16;
    };
    targets = {
#      vesktop.enable = true;
#      librewolf = {
#        colorTheme.enable = true;
#        enable = true;
#        profileNames = [ "default" ];
#      };
#      gtk.enable = true;
#      hyprland = {
#        enable = true;
#        hyprpaper.enable = true;
#      };
#      hyprlock = {
#        enable = true;
#        useWallpaper = true;
#      };
#      kitty.enable = true;
#      mpv.enable = true;
#      vim.enable = true;
#      rofi.enable = true;
#      yazi.enable = true;
    };
  };
}
