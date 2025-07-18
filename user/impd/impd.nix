{ config, lib, pkgs, ... }:

{
  home.file.".config/immersionpod/config".text = ''
    langs=japanese,jpn,jp,ja,english,eng,en
    prefer_internal_subs=yes
    video_dir=/run/media/titor/PortableSSD/Anime/To-Watch
    music_dir=~/Music
    bitrate=34k
    recent_threshold=10
    padding=0.2
    line_skip_pattern="^♪～$|^～♪$"
    filename_skip_pattern="NCOP|NCED"
    extract_audio_add_args=(-af loudnorm=-16:TP=-1.5:LRA=11)
  '';
}
