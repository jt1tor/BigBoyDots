{ config, pkgs, ... }:

{
  programs.iamb = {
    enable = true;
    package = pkgs.iamb;
    settings = {
      default_profile = "user";

      settings = {
        default_room = "#home";
        username_display = "username";
        user_gutter_width = 24;
        request_timeout = 300;
      };

      profiles.user = {
        user_id = "@jt:w33b.cloud";
      };

      settings.image_preview = {
        protocol.type = "kitty";
      };

      settings.notifications = {
        enabled = true;
        via = "desktop";
      };

      settings.users = {
        "@safri:w33b.cloud" = {
          name = "ケイデンさん";
        };
        "@jt:w33b.cloud" = {
          name = "ジョン・タイター";
        };
      };

      settings.sort = {
        rooms = [ "recent" "favorite" "unread"  "name" "lowpriority" ];
      };

      layout = {
        style = "restore";
      };

      macros.normal = {
        "gd" = ":chats<Enter>";
        "r" = ":reply<Enter>";
        "E" = "\"+P";
        "t" = "<C-W>m";
        "<C-g>" = ":redact";
        "<C-J>" = "<C-D>";
        "<C-K>" = "<C-U>";
      };
    };
  };
}
