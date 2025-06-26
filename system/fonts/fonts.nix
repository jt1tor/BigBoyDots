{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    ipafont
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    fira-code
    fira-code-symbols
    ubuntu_font_family
    ipaexfont
    kochi-substitute
    ipafont
    intel-one-mono
    source-han-mono
    source-han-sans
    source-han-serif
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
}
