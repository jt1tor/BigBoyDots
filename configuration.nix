{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.plymouth = {
    enable = true;
    theme = "bgrt";
  };

  # Make some extra kernel modules available to NixOS
  boot.extraModulePackages = with config.boot.kernelPackages;
    [ v4l2loopback ];

  # Activate kernel modules (choose from built-ins and extra ones)
  boot.kernelModules = [
    # Virtual Camera
    "v4l2loopback"
    # Virtual Microphone, built-in
    "snd-aloop"
    "i2c-dev"
  ];

  # Set initial kernel module settings
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 exclusive_caps=1 card_label="Virtual Camera"
  '';

  security.polkit.enable = true;

  networking.hostName = "BigBoy"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # flakes enable
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    download-buffer-size = 8589934592;
  };

  # services
  services = {
#    easyeffects.enable = true;

    ratbagd.enable = true;

    usbmuxd.enable = true;

    mullvad-vpn.enable = true;
    mullvad-vpn.package = pkgs.mullvad-vpn;

    avahi.enable = true;
    avahi.openFirewall = true;

    udisks2.enable = true;

    syncthing = {
      enable = true;
      systemService = true;
    };

    blueman.enable = true;

    xserver = {
      enable = true;
      videoDrivers = [ "nvidia" ];
      xkb = {
        layout = "us";
        variant = "";
      };
    };

    desktopManager.plasma6.enable = false;
    displayManager.sddm = {
      enable = true;
      theme = "chili";
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    udev.packages = [ pkgs.openrgb ];

    hardware.openrgb.enable = true;
  };

  # dconf enable
  programs.dconf.enable = true;

  # nh
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 5";
    flake = "/home/sho-kun/nixos";
  };

  # Enable networking
  networking.networkmanager.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = { 
        Experimental = true;
      };
    };
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
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

  # input method
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      fcitx5-configtool
    ];
  };

  # environment variables
  environment.variables = {
#  QT_IM_MODULE = "fcitx";
#  XMODIFIERS = "@im=fcitx";
#  XMODIFIER = "@im=fcitx";
  GLFW_IM_MODULE = "ibus";
  KWIN_DRM_USE_MODIFIERS = 0;
};

  # paths
  environment.homeBinInPath = true;

  # hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # nix-ld
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      gmp
      zlib
    ];
  };

  # steam
  programs.steam = {
    enable = true;
    protontricks.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # variables
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
    FLAKE = "/home/sho-kun/nixos";
  };

  # boot
  boot.loader.grub = {
    gfxmodeEfi = "1920x1080";
    gfxmodeBios = "1920x1080";
  };
  
  # hardware
  hardware = {
    graphics.enable = true;
    graphics.enable32Bit = true;
    nvidia = {
      nvidiaSettings = true;
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      prime = {
        sync.enable = true;
        
        # intel integrated
        intelBusId = "PCI:0:2:0";

        # nvidia dedicated
        nvidiaBusId = "PCI:1:0:0";
      };
    };
    
#    asus.battery = {
#      chargeUpto = 85;
#      enableChargeUptoScript = true;
#    };
    
    i2c.enable = true;
  };

  # desktop portal
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # sound
  security.rtkit.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sho-kun = {
    isNormalUser = true;
    description = "shojo";
    extraGroups = [ "networkmanager" "wheel" "plugdev" "disk" ];
    packages = with pkgs; [];
    useDefaultShell = true;
  };

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "olm-3.2.16" "dotnet-sdk-6.0.428" "aspnetcore-runtime-6.0.36" ];
  };

  # zsh
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  vim
  wget
  hyprland
  waybar
  dunst
  libnotify
  swww
  rofi-wayland
  networkmanagerapplet
  nwg-look
  bluez
  bluetui
  blueman
  git
  mpd
  brightnessctl
  mullvad-vpn
  btop
  ntfs3g
  ipaexfont
  ripgrep
  fd
  hyprcursor
  android-tools
  android-file-transfer
  gnome-keyring
  cmake
  gnumake
  gcc
  libtool
  libimobiledevice
  ifuse
  usbmuxd
  syncthing
  exfat
  exfatprogs
  dosfstools
  file
  xdg-user-dirs
  ffmpeg
  udiskie
  python3
  wl-clipboard
  mecab
  unzip
  nh
  nix-output-monitor
  nvd
  stack
  easyeffects
  xfce.thunar
  p7zip
  rar
  gvfs
  gnome-keyring
  kdePackages.sddm
  sddm-chili-theme
  libsForQt5.qt5.qtgraphicaleffects
  libsForQt5.qt5.qtquickcontrols2 
  avahi
  alsa-utils
  kdePackages.kdenlive
  obs-studio
  motion
  mame
  ];

  # fonts
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

  system.stateVersion = "25.11"; # Did you read the comment?

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-unstable";
  

  nixpkgs.config.allowUnsupportedSystem = true;

}

