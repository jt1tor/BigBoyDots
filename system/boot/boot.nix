{ config, pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelPackages = with pkgs; [
      linuxPackages_latest
    ];

    kernelModules = [
    
    ];

    extraModulePackages = with config.boot.kernelPackages; [

    ];

    plymouth = {
      enable = true;
      theme = "proxzima";
      themePackages = with pkgs; [
        plymouth-proxzima-theme
      ];
    };
  };
}
