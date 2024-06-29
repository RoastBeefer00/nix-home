{ config, pkgs, ... }: {

  programs.btop = {
      enable = true;
      extraConfig = builtins.readFile ../btop/btop.conf;
  };
}
