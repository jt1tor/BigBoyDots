{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fd
    emacs-all-the-icons-fonts
    ripgrep
    findutils
    nixfmt-rfc-style
    discount
    cmake
    gnumake
    shellcheck
    graphviz
    ispell
  ];

  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  services.emacs = {
    enable = true;
    client.enable = true;
  };

}
