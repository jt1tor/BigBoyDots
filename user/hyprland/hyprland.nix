{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    hyprpaper
    hyprshot
    hyprlock
    brightnessctl
  ];

  services.hyprpaper = {
    enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [
       
    ];
    extraConfig = ''
      ### MONITORS ###
      monitor=eDP-1,1920x1080@60,0x0,1
      monitor=HDMI-A-1,highrr,1920x0,1
      
      ### MY PROGRAMS ###
      $terminal = kitty
      $fileManager = kitty -e yazi
      $menu = rofi -show drun -show-icons
      
      ### AUTOSTART ###
#      exec-once = swww-daemon
#      exec-once = swww-restore
      exec-once = waybar
      exec-once = dunst
      exec-once = mpd
      exec-once = udiskie -t -a -n
      exec-once = hyprctl hyprpaper preload ''+config.stylix.image+''; hyprctl hyprpaper wallpaper ,''+config.stylix.image+''
      
      ### ENVIRONMENT VARIABLES ###
      env = LIBVA_DRIVER_NAME, nvidia
      env = __GLX_VENDOR_LIBRARY_NAME, nvidia
      env = ELECTRON_OZONE_PLATFORM_HINT, auto
      env = GBM_BACKEND, nvidia-drm
      env = SDL_VIDEODRIVER, wayland
      env = WLR_RENDERER_ALLOW_SOFTWARE, 1
      
      ### PERMISSIONS ###
      
      
      ### LOOK AND FEEL ###
      general {
          gaps_in = 4
          gaps_out = 8
          border_size = 1
          col.active_border = rgb(ffffff)
          col.inactive_border = rgba(595959aa)
          resize_on_border = false
          allow_tearing = false
          layout = master
      }
      
      decoration {
          rounding = 6
          rounding_power = 2
          active_opacity = 1
          inactive_opacity = .95
          fullscreen_opacity = 1
          shadow {
              enabled = true
              range = 12
              render_power = 4
              color = rgb(000000)
          }
          blur {
              enabled = true
              size = 3
              passes = 3
              vibrancy = 1
          }
      }
      
      animations {
          enabled = true
          bezier = wind, 0.05, 0.9, 0.1, 1.05
          bezier = winIn, 0.1, 1.1, 0.1, 1.1
          bezier = winOut, 0.3, -0.3, 0, 1
          bezier = liner, 1, 1, 1, 1
          animation = windows, 1, 6, wind, slide
          animation = windowsIn, 1, 6, winIn, slide
          animation = windowsOut, 1, 5, winOut, slide
          animation = windowsMove, 1, 5, wind, slide
          animation = border, 1, 1, liner
          animation = borderangle, 1, 30, liner, loop
          animation = fade, 1, 10, default
          animation = workspaces, 1, 5, wind
      }
      
      dwindle {
          pseudotile = true # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
          preserve_split = true # You probably want this
      }
      
      master { 
          new_status = master
      }
      
      misc {
          force_default_wallpaper = 1 # Set to 0 or 1 to disable the anime mascot wallpapers
          disable_hyprland_logo = true # If true disables the random hyprland logo / anime girl background. :(

      }

      opengl {
          nvidia_anti_flicker = true
      }

      debug {
          damage_tracking = 0
      }
      
      ### INPUT ###
      input {
          kb_layout = us
          kb_variant =
          kb_model =
          kb_options =
          kb_rules =
          repeat_delay = 150
          repeat_rate = 50
          follow_mouse = 1
          sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
          touchpad {
              natural_scroll = false
          }
      }
      
      gestures {
          workspace_swipe = false
      }
      
      device {
          name = epic-mouse-v1
          sensitivity = -0.9
      }
      
      ### CURSOR ###
      cursor {
          inactive_timeout = 5
          default_monitor = HDMI-A-1
          no_hardware_cursors = true
      }
      
      ### KEYBINDINGS ###
      
      $mainMod = SUPER # Sets "Windows" key as main modifier
      
      # hyprland commands
      bind = $mainMod, RETURN, exec, $terminal
      bind = $mainMod, Q, killactive,
      bind = $mainMod, R, exec, $fileManager
      bind = $mainMod, D, exec, $menu
      bind = $mainMod SHIFT, E, exec, hyprctl dispatch  exit
      bind = $mainMod SHIFT CONTROL, L, exec, hyprlock
      bind = $mainMod, F, fullscreen
      bind = $mainMod, C, centerwindow, activewindow
      bind = $mainMod SHIFT, SPACE, togglefloating
      bind = $mainMod SHIFT CONTROL, P, exec, shutdown now
      bind = $mainMod SHIFT, P, exec, bash hyprshot -m region -o ~/pics/scrots/ --freeze
      
      # programs
      bind = $mainMod, A, exec, anki
      bind = $mainMod, W, exec, librewolf
      bind = $mainMod, N, exec, kitty -e newsboat
      bind = $mainMod, M, exec, kitty -e ncmpcpp
      
      # Move focus with mainMod + arrow keys
      bind = $mainMod, H, movefocus, l
      bind = $mainMod, L, movefocus, r
      bind = $mainMod, K, movefocus, u
      bind = $mainMod, J, movefocus, d
      bind = $mainMod SHIFT, H, movewindow, l
      bind = $mainMod SHIFT, L, movewindow, r
      bind = $mainMod SHIFT, K, movewindow, u
      bind = $mainMod SHIFT, J, movewindow, d
      
      # Switch workspaces with mainMod + [0-9]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10
      
      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10
      
      # Example special workspace (scratchpad)
      bind = $mainMod, S, togglespecialworkspace, magic
      bind = $mainMod SHIFT, S, movetoworkspace, special:magic
      
      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1
      
      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow
      
      # Laptop multimedia keys for volume and LCD brightness
      bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
      bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
      bindel = ,XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+
      bindel = ,XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-
      
      # Requires playerctl
      bindl = , XF86AudioNext, exec, playerctl next
      bindl = , XF86AudioPause, exec, playerctl play-pause
      bindl = , XF86AudioPlay, exec, playerctl play-pause
      bindl = , XF86AudioPrev, exec, playerctl previous
      
      ### WINDOWS AND WORKSPACES ###
      # kitty
      windowrule = float, class:kitty
      windowrulev2 = float, class:kitty, center 1
      
      # Ignore maximize requests from apps. You'll probably like this.
      windowrule = suppressevent maximize, class:.*
      
      # Fix some dragging issues with XWayland
      windowrule = nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:-1

      windowrule = opacity 1, class:mpv
    '';
  };
}
