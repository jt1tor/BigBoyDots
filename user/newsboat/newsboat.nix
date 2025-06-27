{ config, pkgs, ... }:

{
  programs.newsboat = {
    enable = true;
    browser = "librewolf";
    maxItems = 0;
    reloadTime = 30;
    extraConfig = ''
      auto-reload yes
      max-items 0
      refresh-on-startup yes
      show-read-feeds yes
      show-read-articles yes
      prepopulate-query-feeds yes

      # Nord Color Scheme - https://github.com/arcticicestudio/nord
      color background          color15    default
      color listnormal          color248   default
      color listnormal_unread   color4     default
      color listfocus           color0     color4
      color listfocus_unread    color0     color4   bold
      color info                color12    color0
      color article             color248   default

      # Highlights
      highlight article "^(Feed|Link):.*$" color6 default bold
      highlight article "^(Title|Date|Author):.*$" color6 default bold
      highlight article "https?://[^ ]+" color10 default underline
      highlight article "\\[[0-9]+\\]" color10 default bold
      highlight article "\\[image\\ [0-9]+\\]" color10 default bold
      highlight feedlist "^─.*$" color6 color0 bold

      # Key Binds
      bind-key h quit
      bind-key j down
      bind-key k up
      bind-key l open
      bind-key H prev-feed
      bind-key L next-feed
      bind-key g home
      bind-key G end
      bind-key SPACE macro-prefix
      bind-key b bookmark
      bind-key ^F pagedown
      bind-key ^B pageup
      bind-key ^H toggle-show-read-feeds

      feedlist-format "%?T?║%4i %n %8u (%T) %t ?"

      macro k set browser "mpv %u" ; open-in-browser; set browser "urlview"
    '';
    queries = {
      # Life
      Life = "jay skullz =~ https://www.youtube.com/feeds/videos.xml?channel_id=UCYCO3Kifwg56zhus3XXiAVg";
    };
  };
}
