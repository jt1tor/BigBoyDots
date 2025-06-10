{ config, pkgs, inputs, ... }:

{
  home.username = "sho-kun";
  home.homeDirectory = "/home/sho-kun/";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  programs.git = {
    enable = true;
    userName = "jt1t0r";
    userEmail = "jt1t0r@proton.me";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "~/nixos";
    };
  };

  # imports
  imports = [
    inputs.nyaa.homeManagerModule
  ];

  home.packages = with pkgs; [
    kitty
    mupdf
    zathura
    qbittorrent
    grim
    hyprshot
    pom
    hyprpicker
    hypridle
    slurp
    jq
    wl-clipboard
    libnotify
    vesktop
    yt-dlg
    iamb
    playerctl
    yazi
    ncmpcpp
    mpv
    librewolf-bin
    qutebrowser
    archivemount
    audacity
#    davinci-resolve
    signal-desktop
    mpc
    sub-batch
    clipgrab
    obsidian
    anki
    vscode
    imagemagick
    system-config-printer
    uxplay
    nsxiv
    hyprlock
    piper
    libratbag
    font-manager
    shotcut
    fastfetch
    p7zip
    xorg.xmodmap
    koreader
    komikku
    peaclock
    lazygit
    gimp
    brillo
    ddcutil
    scrcpy
    ncdu
  ];

  home.sessionVariables = {
    EDITOR = "vim";
    XDG_PICTURES_DIR = "/home/titor/pics/scrots";
    HYPRSHOT_DIR = "/home/titor/pics/scrots";
  };

  programs = {
    # program enable stuff
    kitty.enable = true;
    pywal.enable = true;
    yt-dlp.enable = true;
    zathura.enable = true;
    jq.enable = true;
    emacs.enable = true;
    newsboat.enable = true;
    home-manager.enable = true;
    hyprlock.enable = true;
    obs-studio = {
      enable = true;
      plugins = [
        pkgs.obs-studio-plugins.wlrobs
        pkgs.obs-studio-plugins.obs-pipewire-audio-capture
        pkgs.obs-studio-plugins.advanced-scene-switcher
      ];
    };

    # zsh stuff
    zsh = {

      # zsh enable stuff
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      # zsh startup
      initContent = ''

        fastfetch -l "nixos_old_small" --logo-position left

        gpush() {
          cd ~/nixos
          git add *
          echo -n "Enter commit message: "
          read msg
          git commit -m "$msg"
          git push origin master
          cd ..
        }

      '';

      # zsh oh my zsh stuff
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "refined";
      };

      # zsh shell aliases
      shellAliases = {
        eco = "cd nixos; sudo vim configuration.nix; cd ..";
	eho = "cd nixos; sudo vim home.nix; cd ..";
	hup = "nh home switch; gpush; cd ~/";
	cup = "nh os switch; gpush; cd ~/";
	nixup = "cd ~/nixos; sudo nix flake update; nh os switch; nh home switch; git add *; git commit -m 'system update'; git push origin master; cd ..";
	ssd = "cd /run/media/sho-kun/PortableSSD/Anime/To_Watch";
	rn = "sub-batch rename";
        impd = "bash ~/impd/impd";
      };

      # zsh history
      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };

      # zsh variables
      sessionVariables = {
	EDITOR = "vim";
      };
    };

    # nyaa
    nyaa = {
      enable = true;
      download_client = "DownloadTorrentFile";
      client.download = {
        save_dir = "/run/media/sho-kun/PortableSSD/Anime/Torrents";
	filename = "{file}";
      };
    };
  };

  # services
  services = {
    emacs.enable = true;
    easyeffects.enable = true;
  };

  # dunst source file
  home.file."/.config/dunst/dunstrc".source = ./modules/dunst/dunstrc;

  # gtk source file
  home.file."/.config/gtk-3.0/settings.ini".source = ./modules/gtk-3.0/settings.ini;

  # hyprland source file
  home.file."/.config/hypr/hyprland.conf".source = ./modules/hypr/hyprland.conf;

  # kitty source file
  home.file."/.config/kitty/kitty.conf".source = ./modules/kitty/kitty.conf;

  # newsboat source file
  home.file."/.config/newsboat/config".source = ./modules/newsboat/config;

  # newsboat urls source file
  home.file."/.config/newsboat/urls".source = ./modules/newsboat/urls;

  # rofi source file
  home.file."/.config/rofi/config.rasi".source = ./modules/rofi/config.rasi;

  # waybar source file
  home.file."/.config/waybar/config".source = ./modules/waybar/config;

  # yazi source file
  home.file."/.config/yazi/yazi.toml".source = ./modules/yazi/yazi.toml;

  # yazi keymap source file
  home.file."/.config/yazi/keymap.toml".source = ./modules/yazi/keymap.toml;

  # iamb source file
  home.file."/.config/iamb/config.toml".source = ./modules/iamb/config.toml;

  # mpd source file
  home.file."/.config/mpd/mpd.conf".source = ./modules/mpd/mpd.conf;

}


