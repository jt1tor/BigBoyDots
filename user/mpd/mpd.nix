{ config, pkgs, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "~/Music";
#    playlistDirectory = "~/Music/playlists";
#    dataDir = "/home/titor/.config/mpd";
#    dbFile = "~/.config/mpd/database";
    extraConfig = ''
#      db_file                  "~/.config/mpd/database"
#      log_file                 "syslog"
#      music_directory          "~/Music"
#      playlist_directory       "~/Music/playlists"
##      pid_file                 "~/.config/mpd/pid"
##      state_file               "~/.config/mpd/state"
#      sticker_file             "~/.config/mpd/sticker.sql"
      auto_update              "yes"
#      bind_to_address          "127.0.0.1"
#      restore_paused           "yes"
#      max_output_buffer_size   "16384"
#      port                     "6600"
      audio_output {
        name                   "PipeWire Sound"
        type                   "pipewire"
      }
      audio_output {
        name                   "Visualizer"
        type                   "fifo"
        path                   "/tmp/mpd.fifo"
        format                 "44100:16:2"
      }
    '';
  };
}
