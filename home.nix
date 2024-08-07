{ pkgs, ... }:
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "roastbeefer";
  home.homeDirectory = "/home/roastbeefer";

  nixpkgs.config.allowUnfreePredicate = _: true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  targets.genericLinux.enable = true;

  home.packages = [
    pkgs.bat
    pkgs.brightnessctl
    pkgs.clippy
    pkgs.cowsay
    pkgs.devenv
    pkgs.eza
    pkgs.fira-code-nerdfont
    pkgs.glow
    pkgs.chromium
    pkgs.hyprshot
    pkgs.kmonad
    pkgs.mise
    pkgs.ripgrep
    pkgs.rofi-wayland
    pkgs.rofi-power-menu
    pkgs.skim
    pkgs.swaybg
    pkgs.thefuck
    pkgs.wl-clipboard
    pkgs.zsh-powerlevel10k
  ];
}
