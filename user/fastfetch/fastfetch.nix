{ config, pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;
    package = pkgs.fastfetch;
    settings = {
      logo = {
        type = "file";
        source = "~/nixos/user/fastfetch/nixlogo.txt";
        height = 11;
        padding = {
          top = 2;
          left = 3;
        };
      };
      display = {
        separator = "  ── ";
        key = {
          type = "icon";
          "paddingLeft" = 0;
        };
      };
      modules = [
        "break"
        "break"
        {
          type = "custom";
          format = "┌───────┤ Hardware Information ├───────┐";
        }
        {
          type = "memory";
          "keyIcon" = "   ";
        }
        {
          type = "battery";
          "keyIcon" = "   ";
        }
        {
          type = "custom";
          format = "├───────┤ Software Information ├───────┤";
        }
        {
          type = "title";
          "keyicon" = "   ";
          key = "Title";
          format = "{user-name} @ {host-name}";
        }
        {
          type = "os";
          "keyIcon" = "   ";
        }
        {
          type = "wm";
          "keyIcon" = "   ";
        }
        {
          type = "shell";
          "keyIcon" = "   ";
        }
        {
          type = "uptime";
          "keyIcon" = "   ";
        }
        {
          type = "custom";
          format = "└──────────────────────────────────────┘";
        }
        {
          type = "colors";
          "paddingLeft" = 2;
          symbol = "circle";
        }
      ];
    };
  };
}
