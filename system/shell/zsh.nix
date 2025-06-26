{ config, pkgs, ... }:

let
  # shell aliases
  Aliases = {
#    eco = ;
#    eho = ;
#    nixup = ;
#    cup = ;
#    hup = ;
  };
in

{
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    shellAliases = Aliases;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "";
    };
  };

}
