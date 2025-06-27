{ config, pkgs, ... }:

{
  programs.fastfetch = {
    enable = true;
    package = pkgs.fastfetch;
    settings = {
      logo = {
        type = "kitty";
        source = "gtr.jpg";
        padding = {
          top = 2;
          left = 4;
        };
      };
      display = {
        separator = "  ── ";
        constants = "───────";
        key = {
          type = "icon";
          "paddingLeft" = 0;
        };
      };
      modules = [
        "break"
        {
          type = "custom"
          format = "┌{$1} {#1}Hardware Information{#} {$1}┐";
        }
        {
          type = "memory"
          "keyIcon" = "   ";
        }
        {
          type = "battery";
          "keyIcon" = "   ";
        }
        {
          type = "custom"
          format = "├{$1} {#1}Software Information{#} {$1}┤";
        }
        {
          type = "title";
          "keyicon" = "   ";
          key = "Title";
          format = "{user-name} @ {host-name}";
        }
        {
          type = "os"
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
          format = "└{$1}──────────────────────{$1}┘";
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
