{ config, pkgs, ... }:

{
  imports = [
    ../../user/hyprland/hyprland.nix
    ../../user/waybar/waybar.nix
    ../../user/kitty/kitty.nix
#    ../../user/pywal/pywal.nix
    ../../user/ncmpcpp/ncmpcpp.nix
    ../../user/mpd/mpd.nix
    ../../user/fastfetch/fastfetch.nix
    ../../user/git/git.nix
    ../../user/mpv/mpv.nix
    ../../user/newsboat/newsboat.nix
    ../../user/rofi/rofi.nix
    ../../user/doom-emacs/doom-emacs.nix
    ../../user/stylix/stylix.nix
  ];

  home.packages = with pkgs; [
    qbittorrent
    mpc
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.pointerCursor = {
    enable = true;
    name = if (config.stylix.polarity == "light") then "Quintom_Ink" else "Quintom_Snow";
    package = pkgs.quintom-cursor-theme;
    size = 18;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "titor";
  home.homeDirectory = "/home/titor";
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
