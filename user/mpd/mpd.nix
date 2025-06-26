{ config, pkgs, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/titor/Music";
    playlistDirectory = "/home/titor/playlists";
    dataDir = "/home/titor/.mpd";
    extraConfig = ''
      
    '';
  };
}
