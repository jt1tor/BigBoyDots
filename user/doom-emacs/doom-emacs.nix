{ config, pkgs, ... }:

{
  home.packages = with pkgs; {
    fd
    emacs-all-the-icons-fonts
    ripgrep
    findutils
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  services.emacs = {
    enable = true;
    client.enable = true;
    defaultEditor = true;
  };

}
