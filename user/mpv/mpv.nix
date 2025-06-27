{ config, pkgs, ... }:

{
  programs.mpv = {
    enable = true;
    scripts = with mpvScripts; [
      mpvacious
      memo
      modernz
      eisaa01.smartskip
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
    };
    defaultProfiles = [ ];
    bindings = { };
  };
}
