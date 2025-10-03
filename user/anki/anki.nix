{ config, pkgs, ... }:

{
  programs.anki = {
    enable = true;
    minimalistMode = true;
    reduceMotionn = true;
    style = "native";
    uiScale = 1.2;
    theme = "dark";
    sync = {
      autoSync = true;
      syncMedia = true;
    };
    addon = {
      pkgs.ankiAddons.recolor
      pkgs.ankiAddons.review-heatmap;
      pkgs.ankiAddons.adjust-sound-volume;
      (pkgs.anki-utils.buildAnkiAddon (finalAttrs: {
        pname = "FlexibleGrading";
        version = "0.0";
        src = pkgs.fetchFromGithub {
          owner = "Ajatt-Tools";
          repo = "FlexibleGrading";
          rev = finalAttrs.version;
          sparseCheckout = [ "src/addon" ];
          hash = "1935k2ypwh7hp7rqmgn0a3wkhmz8h4h39dwl7zy1hf3y9sfr0a3d";
        };
        sourceRoot = "${finalAttrs.src.name}/src/addon";
      }))

      pkgs.ankiAddons.FlexibleGrading.withConfig {
        config = {
          buttons = {
            again = "j";
            good = "k";
            undo = "l";
          };
          remember_zoom_level = true;
          pass_fail = true;
          flexible_grading = true;
          remaining_count_type = "default";
          show_last_review = true;
          prevent_clicks = true;
        };
      };
    };
  };
}
