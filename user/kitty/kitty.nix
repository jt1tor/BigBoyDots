{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "base2tone-lavender-dark";
    settings = {
      background_blur = 1;
      enable_audio_bell = "no";
      font_family = "Intel One Mono";
      font_size = 12;
      remember_window_size = "no";
      initial_window_width = 824;
      initial_window_height = 600;
      confirm_os_window_close = 0;
    };
    extraConfig = ''
    '';
  };
}
