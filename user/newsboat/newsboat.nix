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
  };

  home.file."/home/titor/.config/newsboat/urls".text = ''
    ### JAPANESE ###
    https://nyaa.si/?page=rss Nyaa "~nyaa" Torrents

    ### YOUTUBE ###
    ## STUDY ##
    https://www.youtube.com/feeds/videos.xml?channel_id=UCMwo6hT5hI3R56rO2HYP-wQ "~james scholz" Study
    https://www.youtube.com/feeds/videos.xml?channel_id=UC2Zs9v2hL2qZZ7vsAENsg4w "~justin sung" Study
    https://www.youtube.com/feeds/videos.xml?channel_id=UCYqACVYl0c0BhlVN6X2HIMg "~flipping physics" Study
    https://www.youtube.com/feeds/videos.xml?channel_id=UCEWpbFLzoYGPfuWUMFPSaoA "~organic chemistry tutor" Study

    ## LIFE ##
    https://www.youtube.com/feeds/videos.xml?channel_id=UCYCO3Kifwg56zhus3XXiAVg "~jay skullz" Life
    https://www.youtube.com/feeds/videos.xml?channel_id=UClHVl2N3jPEbkNJVx-ItQIQ "~healthygamergg" Life
    https://www.youtube.com/feeds/videos.xml?channel_id=UC1Co9XZd52hiVrePGZ8qfoQ "~spoonfedstudy" Life
    https://www.youtube.com/feeds/videos.xml?channel_id=UCcaWKkWjPre0HyNwVZW5kLA "~haircafe" Life
    https://www.youtube.com/feeds/videos.xml?channel_id=UCQjBsscIa_mgEnSvWpm_9vw "~odysseas" Life

    ## TECH ##
    https://www.youtube.com/feeds/videos.xml?channel_id=UCcaTUtGzOiS4cqrgtcsHYWg "~jvscholz" Tech
    https://www.youtube.com/feeds/videos.xml?channel_id=UCTLUi3oc1-a7dS-2-YgEKmA "~grantcollins" Tech
    https://www.youtube.com/feeds/videos.xml?channel_id=UCP_eG7JBgRWNlNIOLYS6GZA "~crin" Tech

    ## GYM ##
    https://www.youtube.com/feeds/videos.xml?channel_id=UCAo68fdu-hYfgO0y0n-J8qg "~trainer winny" Gym

    ## FOOD ##
    https://www.youtube.com/feeds/videos.xml?channel_id=UCICdNqyJqyHB3_uDVtmFhPA "~cookwell" Food

    ## FUN ##
    https://www.youtube.com/feeds/videos.xml?channel_id=UC7_YxT-KID8kRbqZo7MyscQ "~markiplier" Fun

    ### REDDIT ###
    https://www.reddit.com/user/jvscholz/.rss Reddit "~jvscholz" User
    https://www.reddit.com/r/dumbphones/.rss Reddit "~dumbphones" Sub
    https://www.reddit.com/r/thinkpadsforsale/.rss Reddit "~thinkpadMarket" Sub
  '';
}
