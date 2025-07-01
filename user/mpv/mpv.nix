{ config, pkgs, lib, ... }:

{
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      mpvacious
      memo
      modernz
      eisa01.smartskip
    ];
    config = {
      alang = "ja,jp,jpn,japanese,en,eng,english,English,enUS,en-US";
      save-position-on-quit = "yes";
      sub-auto = "fuzzy";
      subs-with-matching-audio = "yes";
      sub-file-paths = "ass:srt:sub:subs:subtitles:subs.en:subs.ja";
      sub-font = lib.mkForce "IPAex Mincho";
      sub-font-size = 30;
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
      "A" = "cycle-values video-aspect-override '16:9' '16:10' '4:3' '2.35:1' '-1'";
      # Vim Seek Bindings
      "h" = "seek -5";
      "j" = "seek -30";
      "k" = "seek 30";
      "l" = "seek 5";
      # Cycle Subtitles
      "J" = "cycle sub down";
      "K" = "cycle sub";
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
      # Memo Bindings
      "y" = "script-binding memo-history";

    };
    extraInput = ''
      # Open Current Subtitle in Jisho.org
    '';
    scriptOpts = {
      subs2srs = {
        deck_name = "採掘";
        model_name = "Lapis+";
        # Field Names
        sentence_field = "Sentence";
#        secondary_field = "";
        audio_field = "SentenceAudio";
        image_field = "DefinitionPicture";
        note_tag = "subs2srs";
        # Menu Font/Size
        menu_font_size = 12;
        menu_font_name = "IPAex Gothic";
        # Server Settings
        ankiconnect_url = "127.0.0.1:8765";
        # Toggleables
        use_ffmpeg = "no";
        create_deck = "yes";
        allow_duplicates = "no";
        autoclip = "no";
        autoclip_method = "clipboard";
        nuke_spaces = "yes";
        tie_volumes = "no";
        card_overwrite_safeguard = 1;
        clipboard_trim_enabled = "yes";
        append_media = "yes";
        tag_nuke_brackets = "yes";
        tag_nuke_parentheses = "no";
        tag_del_episode_num =  "yes";
        tag_del_after_episode_num = "yes";
        tag_filename_lowercase = "no";
        disable_gui_browse = "no";
        preview_audio = "no";
        show_selected_text = "yes";
        reload_config_before_card_creation = "yes";
        # Image Settings
        snapshot_format = "webp";
        snapshot_quality = 75;
        snapshot_width = "-2";
        snapshot_height = 400;
        screenshot = "no";
        image_template = "<img alt='snapshot' src='%s'>";
        audio_template = "[sound:%s]";
        animated_snapshot_enabled = "no";
        animated_snapshot_format = "avif";
        animated_snapshot_fps = 10;
        animated_snapshot_width = "-2";
        animated_snapshot_height = 400;
        animated_snapshot_quality = 50;
        # Audio Settings
        audio_format = "opus";
        opus_container = "ogg";
        audio_bitrate = "30k";
        audio_padding = "0.1";
        use_forvo = "yes";
#        vocab_field = "";
#        vocab_audio_field = "";
        # Misc Info
        miscinfo_enable = "yes";
#        miscinfo_field = "";
        miscInfo_format = "%n EP%d (%t)";
        # Secondary Subtitles
        secondary_sub_auto_load = "yes";
        secondary_sub_lang = "eng,en";
        secondary_sub_area = "0.15";
        secondary_sub_visibility = "auto";
        # Loudness Normalization
        loudnorm = "no";
        loudnorm_target = "-16";
        loudnorm_range = "11";
        loudnorm_peak = "-1.5";
        # FFMPEG
        ffmpeg_audio_args = "-af loudnorm=I=-16:TP=-1.5:LRA=11:dual_mono=true";
        # MPV
        mpv_audio_args = "--af-append=loudnorm=I=-16:TP=-1.5:LRA=11:dual_mono=true";
      };
      memo = {
        history_path = "~/.memo-history.log";
        entries = 1000;
        pagination = "yes";
        hide_duplicates = "yes";
        hide_same_dir = "no";
        timestamp_format = "%Y-%m-%d %H:%M:%S";
        use_titles = "yes";
        truncate_titles = 60;
        enabled = "yes";
        # Menu Key Binds
        up_binding = "UP WHEEL_UP k";
        down_binding = "DOWN WHEEL_DOWN j";
        select_binding = "RIGHT ENTER l";
        append_binding = "Shift+RIGHT Shift+ENTER Shift+l";
        close_binding = "LEFT ESC h";
        path_prefixes = "pattern:.*";
      };
      modernz = {
        # Looks
        icon_theme = "material";
        idlescreen = "no";
        hidetimeout = 250;
        seek_resets_hidetimeout = "yes";
        fadeduration = 100;
        bottomhover_zone = 120;
        title_font_size = 30;
        chapter_title_font_size = 15;
        time_font_size = 18;
        osc_height = 124;
        # Colors
        seekbarfg_color = lib.mkForce "#6e00ff";
        hover_effect_color = lib.mkForce "#6e00ff";
      };
    };
  };

  home.file."/home/titor/.config/mpv/scripts/next_episode/main.lua".source = ./scripts/next_episode/main.lua;
}
