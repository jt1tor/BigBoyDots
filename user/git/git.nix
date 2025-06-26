{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "jt1tor";
    userEmail = "jt1t0r@proton.me";
    extraConfig = {
      init.defaultbranch = "master";
      safe.directory = "/home/titor/nixos";
    };
  };
}
