{ ... }: {

  programs.btop = {
    enable = true;
    # extraConfig = builtins.readFile ../btop/btop.conf;
  };

  # home.file.".config/btop/themes/catppuccin-mocha.rasi".text = builtins.readFile ../rofi/config.rasi;
  home.file.".config/btop/themes/catppuccin_mocha.theme".text =
    builtins.readFile ../btop/themes/catppuccin_mocha.theme;
}
