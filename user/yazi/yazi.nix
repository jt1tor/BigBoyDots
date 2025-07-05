{ config, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    plugins = {
      mount = pkgs.yaziPlugins.mount;
      full-border = pkgs.yaziPlugins.full-border;
    };

    keymap = {
      # Mount Plugin
      mgr.prepend_keymap = [
        { run = "plugin mount"; on = "M"; }
      ];
    };

    settings = {
      mgr = {
        show_hidden = true;
        sort_by = "alphabetical";
        sort_dir_first = true;
        show_symlink = true;
        scrolloff = 5;
        linemode = "mtime";
      };
      opener = {
        edit = [
          { run = "nvim \"$@\""; desc = "$EDITOR"; block = true; for = "unix"; }
        ];
      };
    };

    initLua = ''
      require("full-border"):setup {
        -- Available: PLAIN or ROUNDED
        type = ui.Border.PLAIN,
      }
    '';
  };
}
