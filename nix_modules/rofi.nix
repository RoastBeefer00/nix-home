{ ... }: {

  home.file.".config/rofi/config.rasi".text =
    builtins.readFile ../rofi/config.rasi;
  home.file.".local/share/rofi/themes/catppuccin-mocha.rasi".text =
    builtins.readFile ../rofi/catppuccin-mocha.rasi;
}
