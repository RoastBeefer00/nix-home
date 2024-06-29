{ lib, ... }: {
    imports = [
      ./btop.nix
      ./hyprland.nix
      ./mako.nix
      ./rofi.nix
      ./waybar.nix
      ./wezterm.nix
      ./zsh.nix
    ];
}

