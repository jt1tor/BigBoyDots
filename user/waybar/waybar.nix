{ config, pkgs, ... }:

{

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "bottom";
        position = "bottom";
        margin-top = 0;
        margin-bottom = 0;
        margin-left = 0;
        margin-right = 0;
        height = 14;
        spacing = 6;
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
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
          };
        };

        # MPD Module
        "mpd" = {
          "format" = "󰽬 {albumArtist} - {title} {elapsedTime}/{totalTime}";
        };

        modules-center = [ "clock" ];

        # Clock Module
        "clock" = {
          "format" = "󰸗 {:%I:%M %p - %a, %d %b %Y}";
          "tooltip" = false;
        };

        modules-right = [ "tray" "pulseaudio" "cpu" "memory" "battery" "disk" "network" ];

        # System Tray Module
        "tray" = {
          "icon-size" = 24;
          "spacing" = 4;
        };

        # PulseAudio Module
        "pulseaudio" = {
          "format" = "󰕾 {volume}%";
          "format-muted" = "Muted {volume}%";
          "scroll-step" = 5;
          "on-click" = "pavucontrol";
        };

        # CPU Module
        "cpu" = {
          "format" = "󰻠 {usage}%";
          "interval" = 1;
          "states" = {
             "critical" = 80;
           };
        };

        # RAM Module
        "memory" = {
          "format" = "󱤓 {percentage}%";
          "interval" = 1;
          "states" = {
            "critical" = 80;
          };
        };

        # Battery Module
        "battery" = {
          "format" = "{icon} {capacity}%";
          "format-icons" = [ "󰂎" "󱊡" "󱊢" "󱊣" ];
          "interval" = 5;
          "states" = {
            "warning" = 25;
            "critical" = 10;
          };
        };

        # Disk Module
        "disk" = {
          "format" = "󰆼 {free}";
          "unit" = "GB";
          "interval" = 30;
          "path" = "/";
        };

        # Network Module
        "network" = {
          "format-wifi" = "󱚽 {essid}";
          "format-disconnected" = "󰖪 {essid}";
        };
      };
    };
    style = ''
      * {
        font-family: Intel One Mono;
        font-size: 12px;
        font-weight: bold;
        padding: 0;
        margin: 0;
      }

      window#waybar {
        background-color: transparent;
        border-radius: 0;
      }

      #workspaces button {
        background-color: transparent;
        color: #00ff00;
        border-radius: 0px;
        padding-left: 6px;
        padding-right: 6px;
        margin-left: 3px;
        margin-right: 3px;
      }

      #workspaces {
        margin-bottom: 6px;
        margin-left: 6px;
        border-radius: 0px;
      }

      #mpd,
      #clock,
      #tray,
      #pulseaudio,
      #cpu,
      #memory,
      #battery,
      #disk,
      #network {
        margin-top: 0px;
        margin-bottom: 6px;
        padding-left: 6px;
        padding-right: 6px;
        border-radius: 0px;
      }

      #network {
        margin-right: 6px;
      }

    '';
  };

}
