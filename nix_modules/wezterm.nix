{ ... }: {

  programs.wezterm = {
    enable = true;
    extraConfig = builtins.readFile ../wezterm/wezterm.lua;
  };
}
