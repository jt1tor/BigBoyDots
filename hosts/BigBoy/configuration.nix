{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../system/shell/zsh.nix
      ../../system/fonts/fonts.nix
      ../../system/bluetooth/bluetooth.nix
      ../../system/sddm/sddm.nix
      ../../system/boot/boot.nix
      ../../system/nvidia/nvidia.nix
      ../../system/stylix/stylix.nix
      ../../system/audio/audio.nix
      ../../system/input/input.nix
      ../../system/keyd/keyd.nix
    ];

  networking.hostName = "BigBoy"; # Define your hostname.

  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  users.users.titor = {
    isNormalUser = true;
    description = "john titor";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim-full
    dunst
    libnotify
    vesktop
    librewolf-bin
    anki
    mpd
    udiskie
    mullvad-vpn
    udisks2
    unzip
    spotify
    wl-clipboard
    steam
    woeusb
    woeusb-ng
    gparted
    ffmpeg-full
  ];

  #  services
  services.udisks2.enable = true;
  services.mullvad-vpn.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
 
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Before changing this value read the documentation for this option
  system.stateVersion = "25.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
