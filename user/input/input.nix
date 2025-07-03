{ config, lib, pkgs, ... }:

{
i18n.inputMethod = {

  enable = true;
  type = "fcitx5";

fcitx5 = {
  waylandFrontend = true;
  addons = with pkgs; [ fcitx5-mozc ];

  settings = {
    inputMethod = {
    GroupOrder."0" = "Default";

    "Groups/0" = {
      Name = "Default";
      "Default Layout" = "us";
      DefaultIM = "mozc";
    };

    "Groups/0/Items/0".Name = "keyboard-us";
    "Groups/0/Items/1".Name = "mozc";
      };
    globalOptions = {

      Behavior = {
        ActiveByDefault = false;
        resetStateWhenFocusIn = "No";
        ShareInputState = "No";
        PreeditEnabledByDefault = true;
        ShowInputMethodInformation = true;
        showInputMethodInformationWhenFocusIn = false;
        CompactInputMethodInformation = true;
        ShowFirstInputMethodInformation = true;
        DefaultPageSize = 5;
        OverrideXkbOption = false;
        CustomXkbOption = "";
        EnabledAddons = "";
        DisabledAddons = "";
        PreloadInputMethod = true;
        AllowInputMethodForPassword = false;
        ShowPreeditForPassword = false;
        AutoSavePeriod = 30;
      };
    };
   };
  };
};

home.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    GLFW_IM_MODULE = "ibus";
    INPUT_METHOD= "fcitx";
    XIM_SERVERS= "fcitx";
  };
}
