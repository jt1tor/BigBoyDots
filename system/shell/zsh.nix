{ config, pkgs, ... }:

let
  # shell aliases
  Aliases = {
    eco = "cd nixos/hosts/BigBoy; sudo vim configuration.nix; cd ..";
    eho = "cd nixos/hosts/BigBoy; vim home.nix; cd ..";
    nixup = "cd nixos; sudo nix flake update; sudo nixos-rebuild switch --flake .; home-manager switch --flake . -b backup";
    cup = "cd nixos; sudo nixos-rebuild switch --flake .; cd ..";
    hup = "cd nixos; home-manager switch --flake . -b backup; cd ..";
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
      theme = "refined";
    };
    shellInit = ''
      fastfetch
    '';
  };

}
