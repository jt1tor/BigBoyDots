{ config, pkgs, ... }:

let
  # shell aliases
  Aliases = {
    eco = "cd nixos/hosts/BigBoy; sudo vim configuration.nix; cd ..";
    eho = "cd nixos/hosts/BigBoy; vim home.nix; cd ..";
    nixup = "cd nixos; sudo nix flake update; nh os switch; nh home switch; cd ..";
    cup = "cd nixos; nh os switch; cd ..";
    hup = "cd nixos; nh home switch; cd ..";
  };
in

{
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  homeBinInPath = true;
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = Aliases;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "refined";
    };
    shellInit = ''
      fastfetch
    '';
  };
  programs.nh = {
    enable = true;
    flake = "/home/titor/nixos";
    clean = {
      enable = true;
      extraArgs = "--keep 5 --keep-since 5d";
    };
  };
}
