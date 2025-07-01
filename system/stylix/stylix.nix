{ pkgs, lib, userSettings, inputs,  ... }:

let
  themePath = "../../../themes/"+("/"+userSettings.theme+"/"+userSettings.theme)+".yaml";
  themePolarity = lib.removeSuffix "\n" (builtins.readFile (./. + "../../../themes"+("/"+userSettings.theme)+"/polarity.txt"));
  backgroundUrl = builtins.readFile (./. + "../../../themes"+("/"+userSettings.theme)+"/backgroundurl.txt");
  backgroundSha256 = builtins.readFile (./. + "../../../themes/"+("/"+userSettings.theme)+"/backgroundsha256.txt");
in
{
  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    enable = true;
    autoEnable = false;
    image = pkgs.fetchurl {
      url = backgroundUrl;
      sha256 = backgroundSha256;
    };
    fonts = {
      serif = {
        package = pkgs.ipaexfont;
        name = "IPAex Mincho";
      };
      sansSerif = {
        package = pkgs.ipaexfont;
        name = "IPAex Gothic";
      };
      monospace = {
        package = pkgs.intel-one-mono;
        name = "Intel One Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
    polarity = themePolarity;
    base16Scheme = ./. + themePath;
    targets = {
      console.enable = true;
      grub.enable = true;
      grub.useWallpaper = true;
    };
  };
}
