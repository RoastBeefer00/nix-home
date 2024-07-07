{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      harpoon2
    ];

    extraConfigLua = builtins.readFile ./harpoon.lua;
  };
}
