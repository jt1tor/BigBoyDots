{ pkgs, lib, userSettings, inputs,  ... }:

let
  themePath = "../../themes/"+userSettings.theme+"/"+userSettings.theme+".yaml";
  themePolarity = lib.removeSuffix "\n" (builtins.readFile (./. + "../../themes"+("/"+userSettings.theme)+"/polarity.txt"));
  backgroundUrl = builtins.readFile (./. + "../../themes"+("/"+userSettings.theme)+"/backgroundurl.txt");
  backgroundSha256 = builtins.readFile (./. + "../../themes/"+("/"+userSettings.theme)+"/backgroundsha256.txt");
in
{
  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    enable = true;
    image = pkgs.fetchurl {
      url = backgroundUrl;
#      sha256 = backgroundSha256;
    };
    polarity = themePolarity;
    base16Scheme = ./. + themePath;
    targets.console.enable = true;
  };
}
