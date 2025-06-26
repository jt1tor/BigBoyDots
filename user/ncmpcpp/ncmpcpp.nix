{ config, pkgs, ... }:

{
  programs.ncmpcpp = {
    enable = true;
    package = pkgs.ncmpcpp;
    bindings = [
      { key = "+"; command = [ "show_clock" ]; }
      { key = "="; command = [ "volume_up" ]; }
      { key = "j"; command = [ "scroll_down" ]; }
      { key = "k"; command = [ "scroll_up" ]; }
      { key = "ctrl-u"; command = [ "page_up" ]; }
      { key = "ctrl-d"; command = [ "page_down" ]; }
      { key = "u"; command = [ "page_up" ]; }
      { key = "d"; command = [ "page_down" ]; }
      { key = "h"; command = [ "previous_column" ]; }
      { key = "l"; command = [ "next_column" ]; }
      { key = "."; command = [ "show_lyrics" ]; }
      { key = "n"; command = [ "next_found_item" ]; }
      { key = "N"; command = [ "previous_found_item" ]; }
      { key = "J"; command = [ "move_sort_order_down" ]; }
      { key = "K"; command = [ "move_sort_order_up" ]; }
      { key = "h"; command = [ "jump_to_parent_directory" ]; }
      { key = "l"; command = [ "enter_directory" ]; }
      { key = "l"; command = [ "run_action" ]; }
      { key = "l"; command = [ "play_item" ]; }
      { key = "m"; command = [ "show_media_library" ]; }
      { key = "m"; command = [ "toggle_media_library_columns_mode" ]; }
      { key = "t"; command = [ "show_tag_editor" ]; }
      { key = "v"; command = [ "show_visualizer" ]; }
      { key = "G"; command = [ "move_end" ]; }
      { key = "g"; command = [ "move_home" ]; }
      { key = "U"; command = [ "update_database" ]; }
      { key = "s"; command = [ "reset_search_engine" ]; }
      { key = "s"; command = [ "show_search_engine" ]; }
      { key = "f"; command = [ "show_browser" ]; }
      { key = "f"; command = [ "change_browse_mode" ]; }
      { key = "x"; command = [ "delete_playlist_items" ]; }
      { key = "P"; command = [ "show_playlist" ]; }
    ];
    settings = {
      ncmpcpp_directory = "~/.config/ncmpcpp";
      lyrics_directory = "~/Music/.lyrics";
      message_delay_time = 1;
      song_list_format = "{$4%a - }{%t}|{$8%f$9}$R{$3(%l)$9}";
      song_status_format = "$b{{$8'%t'}} $3by {$4%a{ $3in $7%b{ (%y)}} $3}|{$8%f}";
      song_library_format = "{%n - }{%t}|{%f}";
      display_volume_level = "yes";
      ignore_leading_the = "yes";
      external_editor = "vim";
      use_console_editor = "yes";
      execute_on_song_change = "notify-send 'Now Playing' '$(mpc --format '%title% \n%artist% - %album%' current)'";
      autocenter_mode = "yes";
      user_interface = "alternative";
      cyclic_scrolling = "no";
      header_text_scrolling = "yes";
      jump_to_now_playing_song_at_start = "yes";
      now_playing_prefix = "-> ";
      progressbar_look = ">> ";
      statusbar_visibility = "yes";
      titles_visibility = "yes";
      centered_cursor = "yes";
      display_bitrate = "yes";
      colors_enabled = "yes";
      empty_tag_color = "magenta";
      main_window_color = "white";
      progressbar_color = "black:b";
      progressbar_elapsed_color = "blue:b";
      statusbar_color = "red";
      statusbar_time_color = "cyan:b";
    };
  };
}
