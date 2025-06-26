{ config, pkgs, ... }:

{
  imports = [
    ../../user/hyprland/hyprland.nix
    ../../user/waybar/waybar.nix
    ../../user/kitty/kitty.nix
    ../../user/pywal/pywal.nix
    ../../user/ncmpcpp/ncmpcpp.nix
    ../../user/mpd/mpd.nix
    ../../user/git/git.nix
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  home.pointerCursor = {
    enable = true;
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
    size = 18;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "titor";
  home.homeDirectory = "/home/titor";
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
