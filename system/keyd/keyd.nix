{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    keyd
  ];

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "overload(control, esc)";
          };
        };
        extraConfig = ''
          [main]
          capslock = overload(control, esc)
          \ = backspace
          backspace = \
          left = noop
          down = noop
          right = noop

          up = layer(nav)
          [nav]

          [ = up
          ; = left
          ' = right
          / = down

          1 = f1
          2 = f2
          3 = f3
          4 = f4
          5 = f5
          6 = f6
          7 = f7
          8 = f8
          9 = f9
          0 = f10
          - = f11
          = = f12

          d = brightnessdown
          f = brightnessup
        '';
      };
    };
  };
}
