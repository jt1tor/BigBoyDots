{ config, pkgs, ... }:

{

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "bottom";
        position = "bottom";
        height = 16;
        output = [ "eDP-1" "HDMI-A-1" ];
        modules-left = [ "hyprland/workspaces" "mpd" ];

        # Hyprland Workspaces Module
        "hyprland/workspaces" = {
          "on-click" = "activate";
          "tooltip" = true;
          "format-icons" = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
          };
        };

        # MPD Module
        "mpd" = {
          "format" = "󰽬 {albumArtist} - {title} {elapsedTime}/{totalTime}";
        };

        modules-center = [ "clock" ];

        # Clock Module
        "clock" = {
          "format" = "󰸗 {:%I:%M %p - %a, %d %b %Y}  ";
          "tooltip" = false;
        };

        modules-right = [ "tray" "pulseaudio" "pulseaudio/slider" "cpu" "memory" "battery" "disk" "network" ];

        # System Tray Module
        "tray" = {
          "icon-size" = 16;
          "spacing" = 8;
        };

        # PulseAudio Module
        "pulseaudio" = {
          "format" = "  󰕾 {volume}%";
          "format-muted" = "  Muted {volume}%";
          "scroll-step" = 5;
          "on-click" = "pavucontrol";
        };

        # PulseAudio Slider Module
        "pulseaudio/slider" = {
          "min" = 0;
          "max" = 100;
          "orientation" = "horizontal";
        };

        # CPU Module
        "cpu" = {
          "format" = "󰻠 {usage}%  ";
          "interval" = 1;
          "states" = {
             "critical" = 80;
           };
        };

        # RAM Module
        "memory" = {
          "format" = "󱤓 {percentage}%  ";
          "interval" = 1;
          "states" = {
            "critical" = 80;
          };
        };

        # Battery Module
        "battery" = {
          "format" = "{icon} {capacity}%  ";
          "format-icons" = [ "󰂎" "󱊡" "󱊢" "󱊣" ];
          "interval" = 5;
          "states" = {
            "warning" = 25;
            "critical" = 10;
          };
        };

        # Disk Module
        "disk" = {
          "format" = "󰆼 {free}  ";
          "unit" = "GB";
          "interval" = 30;
          "path" = "/";
        };

        # Network Module
        "network" = {
          "format-wifi" = "󱚽 {essid}  ";
          "format-disconnected" = "󰖪 {essid}  ";
        };
      };
    };
    style = ''
      * {
        font-family: Intel One Mono;
        font-size: 14px;
        font-weight: bold;
      }

      window#waybar {
        background-color: rgba(35, 35, 35, 0.65);
        color: #ffffff;
      }

      button {
        box-shadow: inset 0 -3px transparent;
        border: none;
        border-radius: 0;
      }

      button:hover {
        background: inherit;
        box-shadow: inset 0 -3px #ffffff;
      }

      #workspaces button {
        padding: 0 5px;
        background-color: transparent;
        color: #ffffff;
      }

      #workspaces button:hover {
        background: rgba(0, 0, 0, 0.2);
      }

      #workspaces button:focused {
        background-color: #ffffff;
        box-shadow: inset 0 -3px #ffffff;
      }

      #pulseaudio-slider slider {
        min-height: 0px;
        min-width: 0px;
        opacity: 0;
        background-image: none;
        border: none;
        border-radius: 0px;
        box-shadow: none;
      }

      #pulseaudio-slider trough {
        min-height: 6px;
        min-width: 100px;
        border-radius: 8px;
        background-color: black;
      }

      #pulseaudio-slider highlight {
        min-height: 6px;
        border-radius: 8px;
        background-color: white;
      }

    '';
  };

}
