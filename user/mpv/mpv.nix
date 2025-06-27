{ config, pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      mpvacious
      memo
      modernz
      eisa01.smartskip
      mpv-playlistmanager
    ];
    scriptOpts = { };
    config = {
      alang = "ja,jp,jpn,japanese,en,eng,english,English,enUS,en-US";
      save-position-on-quit = "yes";
      sub-auto = "fuzzy";
      subs-with-matching-audio = "yes";
      sub-file-paths = "ass:srt:sub:subs:subtitles:subs.en:subs.ja";
      sub-font = "IPAex Gothic";
      sub-font-size = 32;
      sub-ass-override = "force";
      screenshot-directory = "~/pics/mpv";
      screenshot-template = "%F_%wHh%wMm%wSs%wTms";
      screenshot-format = "jpg";
      screenshot-jpeg-quality = "100";
      screenshot-high-bit-depth = "yes";
      osc = "no";
      volume-normalize = "no";
      volume-max = 130;
      cursor-autohide = 80;
      osd-bar-align-y = "-1";
      profile = "gpu-hq";
      hwdec = "auto";
      gpu-api = "auto";
      vo = "gpu-next";
      target-colorspace-hint = "yes";
      deinterlace = "no";
      keep-open = "yes";
      cache-default = 4000000;
    };
    bindings = {
      # Subtitle Scale Size
      "/" = "add sub-scale +0.1";
      "?" = "add sub-scale -0.1";
      # Cycle Video Aspect-Ratios
      "A" = "cycle-values video-aspect '16:9' '16:10' '4:3' '2.35:1' '-1'";
      # Vim Seek Bindings
      "h" = "seek -5";
      "j" = "seek -30";
      "k" = "seek 30";
      "l" = "seek 5";
      # Cycle Subtitles
      "J" = "cycle sub down";
      "K" = "cycle sub";
      # Open Current Subtitle in Jisho.org
      "Ctrl+j" = "run '/bin/sh' '-c' 'librewolf 'moz-extension://012b4bb2-db52-4849-87ea-564e56d37236/search.html?query=${sub-text}''";
      # Change Episode in Playlist
      "<" = "playlist-prev";
      ">" = "playlist-next";
      # Change Subtitle Delay
      "z" = "add sub-delay -0.05";
      "Z" = "add sub-delay +0.05";
      "x" = "sub-step -1";
      "X" = "sub-step 1";
      # IDK
      "V" = "script-binding visibility";
#      "" = "";
    };
  };
}
