{ config, pkgs, userSettings, lib, inputs, ... }:

let
  themePath = "../../../themes"+("/"+userSettings.theme+"/"+userSettings.theme)+".yaml";
  themePolarity = lib.removeSuffix "\n" (builtins.readFile (./. + "../../../themes"+("/"+userSettings.theme)+"/polarity.txt"));
  backgroundUrl = builtins.readFile (./. + "../../../themes"+("/"+userSettings.theme)+"/backgroundurl.txt");
  backgroundSha256 = builtins.readFile (./. + "../../../themes/"+("/"+userSettings.theme)+"/backgroundsha256.txt");
in
{
  imports = [ inputs.stylix.homeManagerModules.stylix ];

  home.file.".currenttheme".text = userSettings.theme;
  stylix = {
    enable = true;
    autoEnable = true;
    image = pkgs.fetchurl {
      url = backgroundUrl;
#      sha256 = backgroundSha256;
    };
    polarity = themePolarity;
    base16Scheme = ./. + themePath;
    targets = {
      kitty.enable = true;
      rofi.enable = true;
      dunst.enable = true;
      vesktop.enable = true;
      emacs.enable = true;
      librewolf.enable = true;
      hyprland.enable = true;
      mpv.enable = true;
      vim.enable = true;
      waybar = {
        enable = true;
        enableCenterBackColors = true;
        enableLeftBackColors = true;
        enableRightBackColors = true;
      };
      yazi.enable = true;
    };
  };

  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = ''+config.stylix.image+''
    wallpaper = ,''+config.stylix.image+''
  '';
}
